#Ram
SetMemoryMax(8192)

#Path
Path = ScriptDir()

#Log

#Load Plug-in
LoadPlugin(Path+"..\dll\filter\DirectShowSource.dll")
LoadPlugin(Path+"..\dll\filter\ConvertStacked.dll")
LoadPlugin(Path+"..\dll\filter\ImageSeq.dll")
LoadPlugin(Path+"..\dll\filter\Shibatch.dll")
LoadPlugin(Path+"..\dll\filter\TimeStretch.dll")
LoadPlugin(Path+"..\dll\filter\VDubFilter.dll")
LoadPlugin("C:\Program Files (x86)\Konayuki-moe\KONAYUKI PLUS\codecs\filters\FFmpeg\ffms2.dll")
LoadPlugin("C:\Program Files (x86)\Konayuki-moe\KONAYUKI PLUS\codecs\filters\VSFilter\XY-VSFilter.dll")

#Apply Filter

Subtract(FFMS2("original.mp4", ATrack=-2, fpsnum=24000, fpsden=1001, ColorSpace="YV12", UTF8=True), FFMS2("thai.mp4", ATrack=-2, fpsnum=24000, fpsden=1001, ColorSpace="YV12", UTF8=True)).Levels(65, 1, 255-64, 0, 255, coring=false)