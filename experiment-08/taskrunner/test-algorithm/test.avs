import("../../avs/OnlySubtitleFrame.avs")
Thai = import("../../avs/english.avs")
Thai_Crop = Thai.Crop(280,620,720,70)

LoadPlugin("../../../experiment-05/dll/splitbergman/YaeRemover.dll")

SubRemove = Thai.YaeRemover(Left = 280,Right = 1000,Top = 620,Bottom = 690,MultiCoarse =10, MultiMid = 1,MultiFine = 10,MultiDepth = 4,ColorGap = 40,Omega = 1.0,Theta = 0.1,Lambda = 500,StokeWidth = 7,StokeGap = 6)
SubRemove = SubRemove.Crop(280,620,720,70)

SubtitleFrame = OnlySubtitleFrame(SubRemove,Thai_Crop)
return SubtitleFrame
