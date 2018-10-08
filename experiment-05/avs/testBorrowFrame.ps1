$data = "borrowframe-normal"
Foreach ($name in $data)
{
	echo "Working on $($name).avs"
	$processTime = Measure-Command{
		ffmpeg  -hide_banner -i "$($name).avs"  -i "original_crop.avs" -lavfi  "ssim;[0:v][1:v]psnr" -f null -
	}
	echo "Processed in $($processTime.totalseconds)"
}