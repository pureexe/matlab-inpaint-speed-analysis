function Generate-AVS {
	$currentAvs = $args[0]
	$currentAvs = $currentAvs -replace "@ALGORITHM@", $args[1]
	$currentAvs = $currentAvs -replace "@MULTICOARSE@", $args[2]
	$currentAvs = $currentAvs -replace "@MULTIMID@", $args[3]
	$currentAvs = $currentAvs -replace "@MULTIFINE@", $args[4]
	$currentAvs = $currentAvs -replace "@MULTIDEPTH@", $args[5]
	$currentAvs = $currentAvs -replace "@CASE@", $args[6]
	Out-File -FilePath "test.avs" -InputObject $currentAvs -Encoding ASCII 
}
function Generate-Mark{
	$currentAvs = $args[0]
	$currentAvs = $currentAvs -replace "@CASE@", $args[1]
	$currentAvs = $currentAvs -replace "@LANGUAGE@", $args[2]
	Out-File -FilePath "mark.avs" -InputObject $currentAvs -Encoding ASCII 
}
function Generate-OnlySubtitle{
	$currentAvs = $args[0]
	$currentAvs = $currentAvs -replace "@CASE@", $args[1]
	$currentAvs = $currentAvs -replace "@LANGUAGE@", $args[2]
	Out-File -FilePath "onlysubtitle.avs" -InputObject $currentAvs -Encoding ASCII 
}
$avsTemplate = Get-Content -Path template-inpaint.avs 
$avsCompareTemplate = Get-Content -Path template-compare.avs
$avsMarkTemplate = Get-Content -Path template-mark.avs
$avsOnlySubtitleTemplate = Get-Content -Path template-original-onlysubtitle.avs
$algorithms = "linearlize-nonoptimize","linearlize-borrow","linearlize-skip","linearlize-skipborrow"
$resolution = (10,3,10,4)
$cases = "01","02","03","04","05"
$language = "english"

Foreach ($algorithm in $algorithms){
	echo "==================="
	Foreach ($case in $cases){
		echo "-------------------"
		Generate-Mark $avsMarkTemplate $case $language
		Generate-AVS $avsTemplate $algorithm $resolution[0] $resolution[1] $resolution[2] $resolution[3] $case
		echo "$($algorithm)"
		if($resolution[3] -eq 1){
			echo "Loop: $($resolution[2])"
		}elseif($resolution[3] -eq 4){
			echo "Loop: $($resolution[0])/$($resolution[1])/$($resolution[1])/$($resolution[2])"
		}
		echo "CASE: $($case)"
		$processTime = Measure-Command{
			ffmpeg -loglevel "panic" -i "test.avs" -f null -
		}
		echo "Processed in $($processTime.totalseconds)"
		Generate-AVS $avsCompareTemplate $algorithm $resolution[0] $resolution[1] $resolution[2] $resolution[3] $case
		Generate-OnlySubtitle $avsOnlySubtitleTemplate $case $language
		echo "Compareing Result... $($algorithm)"
		$env:FFREPORT="file=ffreport.log:level=32"
		$processTime = Measure-Command{
		 ffmpeg -loglevel "panic" -hide_banner -report -i "test.avs" -i "onlysubtitle.avs" -lavfi "ssim;[0:v][1:v]psnr" -f null - 
		}
		echo "Compared in $($processTime.totalseconds)"
		$PSNRandSSIM = Get-content -tail 2 ffreport.log;
		echo $PSNRandSSIM
		echo ""
		# CleanUp
		#Remove-Item test.avs
		#Remove-Item ffreport.log
	}
}
#.\test-opencv.ps1