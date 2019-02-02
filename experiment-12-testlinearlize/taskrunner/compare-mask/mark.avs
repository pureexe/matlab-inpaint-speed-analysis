LoadPlugin("C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\dll\filter\YaeDetector.dll")
caseNumber = 03
Original = import("original.avs")
Subbed = Original.Textsub("../../avs/subtitle/case03/english.ass", FPS=FPS)

top = (caseNumber - 1)*144+37
bottom = top + 70
Detected = Subbed.YaeDetector(Left = 280,Right = 1000,Top = top,Bottom = bottom,StrokeWidth = 6,StrokeGap = 5)
return Detected.Crop(280,top,720,70)
