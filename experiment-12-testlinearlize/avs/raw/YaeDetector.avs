#LoadPlugin("C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\dll\filter\YaeDetector.dll")
LoadPlugin("C:\Users\pakkapon\source\repos\YaeDetector\YaeDetector\x64\Release\YaeDetector.dll")
LoadPlugin("C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\dll\filter\ConvertStacked.dll")
#Subtitled = import("case01-english.avs")
Subtitled = import("C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\avs\subtitle_crop.avs")
Subdetect = Subtitled.YaeDetector()

#Compare Check
(True==True) ? StackHorizontal(Subtitled, Subdetect) : Subdetect
