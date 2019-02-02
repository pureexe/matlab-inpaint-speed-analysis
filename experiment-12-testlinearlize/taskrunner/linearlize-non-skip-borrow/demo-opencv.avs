Subbed = import("mark.avs")

caseNumber = 02
top = (caseNumber - 1)*144+37
bottom = top + 70


LoadPlugin("..\..\..\experiment-05\dll\opencv\YaeRemover.dll")
SubRemove = Subbed.YaeRemover(Left = 280,Right = 1000,ColorGap = 30,StokeWidth = 6,StokeGap = 5)

return SubRemove.Crop(280,top,720,70)
