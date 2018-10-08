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
LoadPlugin(Path+"..\dll\filter\SSIM.dll")
LoadPlugin(Path+"..\dll\splitbergman\YaeRemover.dll")
LoadPlugin("C:\Program Files (x86)\Konayuki-moe\KONAYUKI PLUS\codecs\filters\FFmpeg\ffms2.dll")
LoadPlugin("C:\Program Files (x86)\Konayuki-moe\KONAYUKI PLUS\codecs\filters\VSFilter\XY-VSFilter.dll")

Video = FFMS2("D:\Subbox\Happy Sugar Life\ep5\[HorribleSubs] Happy Sugar Life - 05 [720p].mkv", ATrack=-1, fpsnum=24000, fpsden=1001, ColorSpace="RGB24", UTF8=True)

FPS = Video.Framerate

Original = Video.Trim(17263,18702)

Thai = Original.Textsub("subtitle.ass", FPS=FPS)

Filter = Thai.YaeRemover(Left = 280,Right = 1000,Top = 620,Bottom = 690,MultiCoarse =10, MultiMid = 3,MultiFine = 10,MultiDepth = 4,ColorGap = 40,Omega = 1)

#Original_crop = Original.Crop(280,620,720,70)
Filter_crop = Filter.Crop(280,620,720,70)

Filter_crop

# Compare
#Subtract(Original_crop, Filter_crop).Levels(65, 1, 255-64, 0, 255, coring=false)

# SSIM
#A = SSIM(Original_crop, Filter_crop, "SSIM.csv", "averageSSIM.txt")

# PSNR
#B = Compare(Original_crop, Filter_crop, "", "PSNR.log")

#A+B