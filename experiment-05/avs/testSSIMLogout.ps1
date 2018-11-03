$data = 
	"skipnborrow-normal",
	"skipnborrow-mul-10-1-1-10",
	"skipnborrow-mul-10-3-3-10",
	"skipnborrow-mul-10-10-10-10",
	"skipnborrow-mul-100-5-5-5",
	"skipnborrow-mul-100-5-5-10"
	
Foreach ($name in $data)
{
	echo "Working on $($name).avs"
	$processTime = Measure-Command{
		ffmpeg  -hide_banner -i "$($name).avs"  -i "original_crop.avs" -lavfi  "ssim;[0:v][1:v]psnr" -f null -
	}
	echo "Processed in $($processTime.totalseconds)"
}
#ffmpeg  -hide_banner -i "opencv-normal.avs"  -i "original_crop.avs" -lavfi  "ssim='stats_file=ssim.log';[0:v][1:v]psnr='stats_file=psnr.log'" -f null -