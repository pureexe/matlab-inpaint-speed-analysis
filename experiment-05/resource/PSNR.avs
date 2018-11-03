#Ram
SetMemoryMax(8192)

#Path
FilterPath = "C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\dll\filter"

#Log

#Load Plug-in
LoadPlugin(FilterPath+"\DirectShowSource.dll")
LoadPlugin(FilterPath+"\ConvertStacked.dll")
LoadPlugin(FilterPath+"\ImageSeq.dll")
LoadPlugin(FilterPath+"\Shibatch.dll")
LoadPlugin(FilterPath+"\TimeStretch.dll")
LoadPlugin(FilterPath+"\VDubFilter.dll")
LoadPlugin(FilterPath+"\SSIM.dll")
LoadPlugin("C:\Program Files (x86)\Konayuki-moe\KONAYUKI PLUS\codecs\filters\FFmpeg\ffms2.dll")
LoadPlugin("C:\Program Files (x86)\Konayuki-moe\KONAYUKI PLUS\codecs\filters\VSFilter\XY-VSFilter.dll")

#Apply Filter

OriginalPart = FFMS2("original.mp4", ATrack=-2, fpsnum=24000, fpsden=1001, ColorSpace="YV12", UTF8=True)
CurrentPart =  FFMS2("thai.mp4", ATrack=-2, fpsnum=24000, fpsden=1001, ColorSpace="YV12", UTF8=True)

OriginalPart = OriginalPart.Crop(280,620,720,70)
CurrentPart = CurrentPart.Crop(280,620,720,70)


SSIM(OriginalPart, CurrentPart, "results.csv", "averageSSIM.txt")
#ComparePart = Compare(OriginalPart, CurrentPart, "", "compare.log")

#Subtract(OriginalPart,CurrentPart).Levels(65, 1, 255-64, 0, 255, coring=false)

#ComparePart