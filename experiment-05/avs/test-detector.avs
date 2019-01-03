Thai = import("subtitle_thai.avs")
LoadPlugin("C:\Users\pakkapon\source\repos\YaeDetector\YaeDetector\x64\Release\YaeDetector.dll")
SubRemove = Thai.YaeDetector(Left = 280,Right = 1000,Top = 620,Bottom = 690)

return SubRemove