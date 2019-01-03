LoadPlugin("C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\dll\filter\CountDifferencePixel.dll")result = import("mask.avs")
bClip=Blankclip(result)
differenceCount = CountDifferencePixel(result,bClip)
filename = "count-mask.txt"
clip=Blankclip(length = 1)
writefile(clip, filename, "differenceCount", append=false, flush=true)
