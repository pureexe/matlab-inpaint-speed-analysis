Thai = import("..\..\avs\english.avs")
LoadPlugin("..\..\..\experiment-05\dll\skipnborrow\YaeRemover.dll")

SubRemove = Thai.YaeRemover(Left = 280,Right = 1000,Top = 620,Bottom = 690,MultiCoarse = 10, MultiMid =10,MultiFine = 10,MultiDepth = 4,ColorGap = 40,Omega = 1.0,Theta = 0.1,Lambda = 500,StokeWidth = 7,StokeGap = 6)

return SubRemove.Crop(280,620,720,70)