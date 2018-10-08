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
LoadPlugin("C:\Program Files (x86)\Konayuki-moe\KONAYUKI PLUS\codecs\filters\VSFilter\XY-VSFilter.dll")

Function LoadSomething(String Path) {

FFMS2(Path, ATrack=-2, fpsnum=24000, fpsden=1001, ColorSpace="YV12", UTF8=True)

}

Video00 = LoadSomething("fine00.mp4")
Video01 = LoadSomething("fine01.mp4")
Video02 = LoadSomething("fine02.mp4")
Video03 = LoadSomething("fine03.mp4")
Video04 = LoadSomething("fine04.mp4")
Video05 = LoadSomething("fine05.mp4")
Video06 = LoadSomething("fine06.mp4")
Video07 = LoadSomething("fine07.mp4")
Video08 = LoadSomething("fine08.mp4")
Video09 = LoadSomething("fine09.mp4")
Video10 = LoadSomething("fine10.mp4")

videoMerge = StackVertical(Video00,Video01)
videoMerge = StackVertical(videoMerge,Video02)
videoMerge = StackVertical(videoMerge,Video03)
videoMerge = StackVertical(videoMerge,Video04)
videoMerge = StackVertical(videoMerge,Video05)
videoMerge = StackVertical(videoMerge,Video06)
videoMerge = StackVertical(videoMerge,Video07)
videoMerge = StackVertical(videoMerge,Video08)
videoMerge = StackVertical(videoMerge,Video09)
videoMerge = StackVertical(videoMerge,Video10)
videoMerge
#StackVertical()