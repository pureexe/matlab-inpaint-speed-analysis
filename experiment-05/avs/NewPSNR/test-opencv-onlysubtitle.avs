import("../OnlySubtitleFrame.avs")
Thai = import("../subtitle_thai.avs")
Thai_Crop = Thai.Crop(280,620,720,70)

LoadPlugin(ScriptDir()+"..\..\dll\opencv\YaeRemover.dll")

SubRemove = Thai.YaeRemover(Left = 280,Right = 1000,Top = 620,Bottom = 690,ColorGap = 40)
SubRemove = SubRemove.Crop(280,620,720,70)

SubtitleFrame = OnlySubtitleFrame(SubRemove,Thai_Crop)
return SubtitleFrame