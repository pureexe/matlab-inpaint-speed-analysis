import("../../avs/OnlySubtitleFrame.avs")
Subbed = import("../../avs/english.avs")
Subbed_Crop = Subbed.Crop(280,620,720,70)

LoadPlugin("../../../experiment-05/dll/opencv/YaeRemover.dll")

SubRemove = Subbed.YaeRemover(Left = 280,Right = 1000,Top = 620,Bottom = 690,ColorGap = 30,StokeWidth = 7,StokeGap = 6)
SubRemove = SubRemove.Crop(280,620,720,70)

SubtitleFrame = OnlySubtitleFrame(SubRemove,Subbed_Crop)
return SubtitleFrame