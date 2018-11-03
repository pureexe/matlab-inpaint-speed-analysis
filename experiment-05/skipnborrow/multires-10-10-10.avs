#Ram
SetMemoryMax(8192)

#Path
Path = ScriptDir()

#Log
File_Name = ReplaceStr(ScriptFile(), ".avs", "")

#Load Plug-in
LoadPlugin("C:\Program Files (x86)\Konayuki-moe\KONAYUKI PLUS\codecs\filters\FFmpeg\ffms2.dll")
LoadPlugin(Path+"..\dll\filter\ConvertStacked.dll")
LoadPlugin(Path+"..\dll\filter\ImageSeq.dll")
LoadPlugin(Path+"..\dll\filter\Shibatch.dll")
LoadPlugin(Path+"..\dll\filter\TimeStretch.dll")
LoadPlugin(Path+"..\dll\filter\VDubFilter.dll")
LoadPlugin(Path+"..\dll\skipnborrow\YaeRemover.dll")

#Apply Filter
Video = FFMS2("C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\resource\thai.mp4", ATrack=-1, fpsnum=24000, fpsden=1001, ColorSpace="YV12", UTF8=True).ConvertToRGB24
Filter = Video.YaeRemover(Left = 280,Right = 1000,Top = 620,Bottom = 690,MultiCoarse =10, MultiMid = 10,MultiFine = 10,MultiDepth = 4,ColorGap = 40,Omega = 1.2)

#Compare Check
(False==True) ? StackHorizontal(Video, Filter) : Filter

#Prefetch(8)