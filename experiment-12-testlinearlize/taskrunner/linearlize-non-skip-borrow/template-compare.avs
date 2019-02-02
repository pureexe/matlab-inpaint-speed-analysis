import("../../avs/raw/OnlySubtitleFrame.avs")
Mark = import("mark.avs")

caseNumber = @CASE@
top = (caseNumber - 1)*144+37
bottom = top + 70

Mark_Crop = Mark.Crop(280,top,720,70)

LoadPlugin("../../../experiment-05/dll/@ALGORITHM@/YaeRemover.dll")

SubRemove = Mark.YaeRemover(Left = 280,Right = 1000,Top = top,Bottom = bottom,MultiCoarse =@MULTICOARSE@, MultiMid = @MULTIMID@,MultiFine = @MULTIFINE@,MultiDepth = @MULTIDEPTH@,ColorGap = 30,Omega = 1.0,Theta = 5,Lambda = 250,StokeWidth = 6,StokeGap = 5)
SubRemove = SubRemove.Crop(280,top,720,70)

SubtitleFrame = OnlySubtitleFrame(SubRemove,Mark_Crop)
return SubtitleFrame