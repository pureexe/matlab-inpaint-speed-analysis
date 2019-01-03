LoadPlugin("C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\dll\filter\CountDifferencePixel.dll")
result = import("mark.avs")
cover = import("mask.avs")
differenceCount = CountDifferencePixel(result,cover)
filename = "count-compare.txt"
clip=Blankclip(length = 1)
writefile(clip, filename, "differenceCount", append=false, flush=true)
