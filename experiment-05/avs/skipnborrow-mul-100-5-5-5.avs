#SetFilterMTMode("DEFAULT_MT_MODE", 2)

Thai = import("subtitle_thai.avs")
LoadPlugin(Path+"..\dll\skipnborrow\YaeRemover.dll")
SubRemove = Thai.YaeRemover(Left = 280,Right = 1000,Top = 620,Bottom = 690,MultiCoarse =100, MultiMid = 5,MultiFine = 5,MultiDepth = 4,ColorGap = 40,Omega = 1.0)

SubRemove.Crop(280,620,720,70)
#Prefetch(4)
