#Ram
SetMemoryMax(8192)

PluginPath = "C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\dll\filter"
KonayukiPath = "C:\Program Files (x86)\Konayuki-moe\KONAYUKI PLUS\codecs\filters\"
#Load Plug-in
LoadPlugin(PluginPath+"\ConvertStacked.dll")
LoadPlugin(PluginPath+"\ImageSeq.dll")
LoadPlugin(PluginPath+"\Shibatch.dll")
LoadPlugin(PluginPath+"\TimeStretch.dll")
LoadPlugin(PluginPath+"\VDubFilter.dll")
LoadPlugin(KonayukiPath+"\FFmpeg\ffms2.dll")
LoadPlugin(KonayukiPath+"\VSFilter\XY-VSFilter.dll")

Video = FFMS2("C:\Users\pakkapon\Desktop\resource\anime-part\raw.mp4", ATrack=-1, fpsnum=24000, fpsden=1000, ColorSpace="RGB24", UTF8=True)

FPS = Video.Framerate

FrameCount = 1440/4
Original = Video.Trim(0,FrameCount)

return Original