LoadPlugin("C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\dll\filter\HasSubtitle.dll")

function OnlySubtitleFrame(clip Source, clip Reference)
{
	resultVideo = BlankClip(Source,length = 0)
	For(i=1, Source.FrameCount){
		if(HasSubtitle(Reference,Frame=i,ColorGap = 40)){
			resultVideo = resultVideo + Source.Trim(i,i)
		}
	}
	return resultVideo
}


