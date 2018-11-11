function Generate-AVS {
	$currentAvs = $args[0]
	$currentAvs = $currentAvs -replace "@ALGORITHM@", $args[1]
	$currentAvs = $currentAvs -replace "@MULTICOARSE@", $args[2]
	$currentAvs = $currentAvs -replace "@MULTIMID@", $args[3]
	$currentAvs = $currentAvs -replace "@MULTIFINE@", $args[4]
	$currentAvs = $currentAvs -replace "@MULTIDEPTH@", $args[5]
	Out-File -FilePath "test.avs" -InputObject $currentAvs -Encoding ASCII 
}
$avsTemplate = Get-Content -Path inpaint_template.avs 
$avsCompareTemplate = Get-Content -Path compare_template.avs
$algorithms = "skipnborrow","skipborrow-bilinear","skipborrow-bilinear-filter-first", "skipborrow-bilinear-filter-all", "skipborrow-bicubic", "skipborrow-bicubic-filter-first", "skipborrow-bicubic-filter-all" #test only skipborrowlinearlize
$resolutions = (10,1,10,1),(10,1,10,4),(10,3,10,4),(10,10,10,4),(100,5,5,4),(100,5,10,4)
Foreach ($algorithm in $algorithms){
	echo "==================="
	Foreach ($resolution in $resolutions){
		echo "-------------------"
		Generate-AVS $avsTemplate $algorithm $resolution[0] $resolution[1] $resolution[2] $resolution[3]
		echo "$($algorithm)"
		if($resolution[3] -eq 1){
			echo "Loop: $($resolution[2])"
		}elseif($resolution[3] -eq 4){
			echo "Loop: $($resolution[0])/$($resolution[1])/$($resolution[1])/$($resolution[2])"
		}
	
		$processTime = Measure-Command{
			ffmpeg -loglevel "panic" -i "test.avs" -f null -
		}
		echo "Processed in $($processTime.totalseconds)"
		Generate-AVS $avsCompareTemplate $algorithm $resolution[0] $resolution[1] $resolution[2] $resolution[3]
		echo "Compareing Result... $($algorithm)"
		$env:FFREPORT="file=ffreport.log:level=32"
		$processTime = Measure-Command{
		 ffmpeg -loglevel "panic" -hide_banner -report -i "test.avs" -i "original_crop_onlysubtitle.avs" -lavfi "ssim;[0:v][1:v]psnr" -f null - 
		}
		echo "Compared in $($processTime.totalseconds)"
		$PSNRandSSIM = Get-content -tail 2 ffreport.log;
		echo $PSNRandSSIM
		echo ""
		# CleanUp
		Remove-Item test.avs
		Remove-Item ffreport.log
	}
}
echo "==================="
echo "OpenCV"
$processTime = Measure-Command{
	ffmpeg -loglevel "panic" -i "test-opencv.avs" -f null -
}
echo "Processed in $($processTime.totalseconds)"
$env:FFREPORT="file=ffreport.log:level=32"
$processTime = Measure-Command{
	ffmpeg -loglevel "panic" -hide_banner -report -i "test-opencv-onlysubtitle.avs" -i "original_crop_onlysubtitle.avs" -lavfi "ssim;[0:v][1:v]psnr" -f null - 
}
echo "Compared in $($processTime.totalseconds)"
$PSNRandSSIM = Get-content -tail 2 ffreport.log;
echo $PSNRandSSIM
echo ""
# CleanUp
Remove-Item ffreport.log
