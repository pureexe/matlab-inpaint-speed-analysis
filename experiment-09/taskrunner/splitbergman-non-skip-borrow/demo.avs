Subbed = import("mark.avs")
LoadPlugin(ScriptDir()+"..\..\..\experiment-05\dll\skipnborrow\YaeRemover.dll")

caseNumber = 05
top = (caseNumber - 1)*144+37
bottom = top + 70

SubRemove = Subbed.YaeRemover(Left = 280,Right = 1000,Top = top,Bottom = bottom,MultiCoarse = 10, MultiMid = 3,MultiFine = 10,MultiDepth = 4,ColorGap = 30,Omega = 1.0,Theta = 5,Lambda = 250,StokeWidth = 6,StokeGap = 5,Tol = 0.0001)

return StackHorizontal(Subbed, SubRemove)