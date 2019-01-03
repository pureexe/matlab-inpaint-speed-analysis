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
