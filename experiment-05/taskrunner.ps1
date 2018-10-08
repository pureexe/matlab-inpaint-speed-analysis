$data = "splitbergman/splitbergman","splitbergman/multires-10-01-10","splitbergman/multires-10-03-10","splitbergman/multires-10-10-10","splitbergman/multires-100-05-05","splitbergman/multires-100-05-10","borrowframe/borrowframe","borrowframe/multires-10-01-10","borrowframe/multires-10-03-10","borrowframe/multires-10-10-10","borrowframe/multires-100-05-05","borrowframe/multires-100-05-10","opencv/opencv"
Foreach ($name in $data)
{
	echo "Working on $($name).avs"
	Measure-Command{
	ffmpeg.exe -y -i "$($name).avs" -c:v h264_nvenc -rc constqp -preset lossless -profile:v high -qp 0 -c:a aac -b:a 128k -aac_coder 1 "$($name).mp4"}
}