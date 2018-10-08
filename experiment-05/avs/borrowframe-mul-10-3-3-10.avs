Thai = import("subtitle_thai.avs")
LoadPlugin(Path+"..\dll\borrowframe\YaeRemover.dll")
SubRemove = Thai.YaeRemover(Left = 280,Right = 1000,Top = 620,Bottom = 690,MultiCoarse =10, MultiMid = 3,MultiFine = 10,MultiDepth = 4,ColorGap = 40,Omega = 1.0)

return SubRemove.Crop(280,620,720,70)