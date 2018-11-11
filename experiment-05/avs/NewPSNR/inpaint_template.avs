Thai = import("..\subtitle_thai.avs")
LoadPlugin(Path+"..\dll\@ALGORITHM@\YaeRemover.dll")

SubRemove = Thai.YaeRemover(Left = 280,Right = 1000,Top = 620,Bottom = 690,MultiCoarse =@MULTICOARSE@, MultiMid = @MULTIMID@,MultiFine = @MULTIFINE@,MultiDepth = @MULTIDEPTH@,ColorGap = 40,Omega = 1.0,Theta = 0.1,Lambda = 500)

return SubRemove.Crop(280,620,720,70)