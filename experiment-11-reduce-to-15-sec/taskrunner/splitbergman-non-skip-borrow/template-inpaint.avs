Subbed = import("mark.avs")
LoadPlugin("..\..\..\experiment-05\dll\@ALGORITHM@\YaeRemover.dll")

caseNumber = @CASE@
top = (caseNumber - 1)*144+37
bottom = top + 70

SubRemove = Subbed.YaeRemover(Left = 280,Right = 1000,Top = top,Bottom = bottom,MultiCoarse = @MULTICOARSE@, MultiMid = @MULTIMID@,MultiFine = @MULTIFINE@,MultiDepth = @MULTIDEPTH@,ColorGap = 30,Omega = 1.0,Theta = 5,Lambda = 250,StokeWidth = 6,StokeGap = 5,Tol = 0.0001)

return SubRemove.Crop(280,top,720,70)