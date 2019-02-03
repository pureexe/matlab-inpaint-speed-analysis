$languages = "english","thai","japanese"
$cases = "01","02","03","04","05"
#$cases = "03"
#$languages = "english"

function Generate-AVS {
	$currentAvs = $args[0]
	$currentAvs = $currentAvs -replace "@LANGUAGE@", $args[1]
	$currentAvs = $currentAvs -replace "@CASE@", $args[2]
	Out-File -FilePath "$($args[3])" -InputObject $currentAvs -Encoding ASCII 
}

function Count-AVS {
	$current = $args[0]
	$env:FFREPORT="file=ffreport.log:level=32"
	ffmpeg -loglevel "panic" -hide_banner -report -i "count-$($current).avs" -f null -
	$result = Get-Content -Path "count-$($current).txt"
	echo "count_$($current): $($result)"
}

$markTemplate = Get-Content -Path template-mark.avs
$maskTemplate = Get-Content -Path template-mask.avs
$countMarkTemplate = Get-Content -Path template-mark-count.avs
$countMaskTemplate = Get-Content -Path template-mask-count.avs
$countCompareTemplate = Get-Content -Path template-compare-count.avs 

Foreach ($language in $languages){
	Foreach ($case in $cases){
		echo "-------------------"
		echo "language: $($language)"
		echo "case: $($case)"
		Generate-AVS $markTemplate $language $case "mark.avs"
		Generate-AVS $maskTemplate $language $case "mask.avs"
		Generate-AVS $countMarkTemplate $language $case "count-mark.avs"
		Generate-AVS $countMaskTemplate $language $case "count-mask.avs"
		Generate-AVS $countCompareTemplate $language $case "count-compare.avs"
		$processTime = Measure-Command{
			ffmpeg -loglevel "panic" -hide_banner  -i "mark.avs" -f null - 
		}
		echo "process_time: $($processTime.totalseconds)"
		$env:FFREPORT="file=ffreport.log:level=32"
		$processTime = Measure-Command{
			ffmpeg -loglevel "panic" -hide_banner -report  -i "mark.avs" -i "mask.avs" -lavfi "ssim;[0:v][1:v]psnr" -f null - 
		}
		echo "SSIM_PSNR_TIME: $($processTime.totalseconds)"
		$PSNRandSSIM = Get-content -tail 2 ffreport.log;
		echo $PSNRandSSIM
		Count-AVS("mark")
		Count-AVS("mask")
		Count-AVS("compare")
		#Remove-Item mark.avs
		#Remove-Item mask.avs
		#Remove-Item count-mark.avs
		#Remove-Item count-mask.avs
		#Remove-Item count-compare.avs
		#Remove-Item count-mark.txt
		#Remove-Item count-mask.txt
		#Remove-Item count-compare.txt
		#Remove-Item ffreport.log
	}
}