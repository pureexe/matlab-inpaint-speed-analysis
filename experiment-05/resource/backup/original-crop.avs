#Ram
SetMemoryMax(8192)

#Path
Path = ScriptDir()

#Load Plug-in
LoadPlugin(Path+"..\dll\filter\ConvertStacked.dll")
LoadPlugin(Path+"..\dll\filter\ImageSeq.dll")
LoadPlugin(Path+"..\dll\filter\Shibatch.dll")
LoadPlugin(Path+"..\dll\filter\TimeStretch.dll")
LoadPlugin(Path+"..\dll\filter\VDubFilter.dll")
LoadPlugin("C:\Program Files (x86)\Konayuki-moe\KONAYUKI PLUS\codecs\filters\FFmpeg\ffms2.dll")

FFMS2("D:\Subbox\Happy Sugar Life\ep5\[HorribleSubs] Happy Sugar Life - 05 [720p].mkv", ATrack=-1, fpsnum=24000, fpsden=1001, ColorSpace="RGB24", UTF8=True).Trim(17263,18702).Crop(280,620,720,70)