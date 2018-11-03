$data = 
	"splitbergman-normal",
	"splitbergman-mul-10-1-1-10",
	"splitbergman-mul-10-3-3-10",
	"splitbergman-mul-10-10-10-10",
	"splitbergman-mul-100-5-5-5",
	"splitbergman-mul-100-5-5-10",
	"borrowframe-normal",
	"borrowframe-mul-10-1-1-10",
	"borrowframe-mul-10-3-3-10",
	"borrowframe-mul-10-10-10-10",
	"borrowframe-mul-100-5-5-5",
	"borrowframe-mul-100-5-5-10",
	"borrowframe-mul-100-5-5-10",
	"skipnborrow-normal",
	"skipnborrow-mul-10-1-1-10",
	"skipnborrow-mul-10-3-3-10",
	"skipnborrow-mul-10-10-10-10",
	"skipnborrow-mul-100-5-5-5",
	"skipnborrow-mul-100-5-5-10",
	"skipnborrow-mul-100-5-5-10",
	"opencv-normal"

Foreach ($name in $data)
{
	echo "Working on $($name).avs"
	$processTime = Measure-Command{
		ffmpeg  -hide_banner -i "$($name).avs"  -i "original_crop.avs" -lavfi  "ssim;[0:v][1:v]psnr" -f null -
	}
	echo "Processed in $($processTime.totalseconds)"
}