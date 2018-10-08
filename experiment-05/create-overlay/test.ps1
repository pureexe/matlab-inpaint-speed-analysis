For($i=1; $i -lt 11; $i++)
{
	$u = $i.ToString("00")
	ffmpeg.exe -y -i "fine$($u).avs" -c:v h264_nvenc -rc constqp -preset slow -profile:v high -qp 0 -an "fine$($u).mp4"
}