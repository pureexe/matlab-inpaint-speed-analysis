Thai = import("subtitle_thai.avs")
LoadPlugin(ScriptDir()+"..\dll\opencv\YaeRemover.dll")
SubRemove = Thai.YaeRemover(Left = 280,Right = 1000,Top = 620,Bottom = 690,ColorGap = 40)

return SubRemove.Crop(280,620,720,70)