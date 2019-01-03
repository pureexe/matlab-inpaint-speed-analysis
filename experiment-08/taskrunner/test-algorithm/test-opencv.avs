Thai = import("..\..\avs\english.avs")
LoadPlugin(ScriptDir()+"..\..\..\experiment-05\dll\opencv\YaeRemover.dll")
#LoadPlugin(ScriptDir()+"..\..\..\experiment-05\dll\filter\YaeDetector.dll")
SubRemove = Thai.YaeRemover(Left = 280,Right = 1000,Top = 620,Bottom = 690,ColorGap = 30,StokeWidth = 7,StokeGap = 6)

SubRemove.Crop(280,620,720,70)