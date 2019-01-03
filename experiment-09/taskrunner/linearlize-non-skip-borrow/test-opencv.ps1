function Generate-AVS {
	$currentAvs = args[0]
	$currentAvs = $currentAvs -replace "@CASE@", $args[1]
	$currentAvs = $currentAvs -replace "@LANGUAGE@", $args[2]
	Out-File -FilePath "test.avs" -InputObject $currentAvs -Encoding ASCII 
}
function Generate-Mark{
	$currentAvs = args[0]
	$currentAvs = $currentAvs -replace "@CASE@", $args[1]
	$currentAvs = $currentAvs -replace "@LANGUAGE@", $args[2]
	Out-File -FilePath "mark.avs" -InputObject $currentAvs -Encoding ASCII 
}
function Generate-OnlySubtitle{
	$currentAvs = args[0]
	$currentAvs = $currentAvs -replace "@CASE@", $args[1]
	$currentAvs = $currentAvs -replace "@LANGUAGE@", $args[2]
	Out-File -FilePath "onlysubtitle.avs" -InputObject $currentAvs -Encoding ASCII 
}

$avsMarkTemplate = Get-Content -Path template-mark.avs
$avsInpaintTemplate = Get-Content -Path template-opencv.avs
$avsOnlySubtitleTemplate = Get-Content -Path template-original-onlysubtitle.avs
$cases = "01","02","03","04","05"
$language = "english"

echo "==================="
Foreach ($case in $cases){
	echo "-------------------"
	echo "OpenCV"
	echo "Loop: -"
	Generate-Mark $avsMarkTemplate $case $language
	$processTime = Measure-Command{
		ffmpeg -loglevel "panic" -i "test-opencv.avs" -f null -
	}
	echo "Processed in $($processTime.totalseconds)"
	Generate-OnlySubtitle $avsOnlySubtitleTemplate $case $language
	echo "Compareing Result... )"
	$env:FFREPORT="file=ffreport.log:level=32"
	$processTime = Measure-Command{
		ffmpeg -loglevel "panic" -hide_banner -report -i "test-opencv-onlysubtitle.avs" -i "onlysubtitle.avs" -lavfi "ssim;[0:v][1:v]psnr" -f null - 
	}
	echo "Compared in $($processTime.totalseconds)"
	$PSNRandSSIM = Get-content -tail 2 ffreport.log;
	echo $PSNRandSSIM
	echo ""
	# CleanUp
	Remove-Item ffreport.log
}


