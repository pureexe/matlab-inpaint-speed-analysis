Subbed = import("mark.avs")
LoadPlugin(ScriptDir()+"..\..\..\experiment-05\dll\opencv\YaeRemover.dll")

caseNumber = @CASE@
top = (caseNumber - 1)*144+37
bottom = top + 70

SubRemove = Subbed.YaeRemover(Left = 280,Right = 1000,Top = top,Bottom = bottom,ColorGap = 30,StokeWidth = 6,StokeGap = 5)

SubRemove.Crop(280,top,720,70)