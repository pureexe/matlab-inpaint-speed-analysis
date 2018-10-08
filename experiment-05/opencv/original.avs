#Ram
SetMemoryMax(8192)

#Path
Path = ScriptDir()

#Log
File_Name = ReplaceStr(ScriptFile(), ".avs", "")

#Load Plug-in
LoadPlugin(Path+"..\dll\filter\DirectShowSource.dll")
LoadPlugin(Path+"..\dll\filter\ConvertStacked.dll")
LoadPlugin(Path+"..\dll\filter\ImageSeq.dll")
LoadPlugin(Path+"..\dll\filter\Shibatch.dll")
LoadPlugin(Path+"..\dll\filter\TimeStretch.dll")
LoadPlugin(Path+"..\dll\filter\VDubFilter.dll")
LoadPlugin(Path+"..\dll\opencv\YaeRemover.dll")

#Apply Filter
Video = DirectShowSource("C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\resource\real_original.mp4", Audio=True, Video=True).ConvertToRGB24
Filter = Video

#Compare Check
(False==True) ? StackHorizontal(Video, Filter) : Filter

#Prefetch(8)