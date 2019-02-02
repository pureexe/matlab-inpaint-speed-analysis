LoadPlugin("C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\dll\filter\CountDifferencePixel.dll")
cover = import("mark.avs")
bClip=Blankclip(cover)
differenceCount = CountDifferencePixel(cover,bClip)
filename = "count-mark.txt"
clip=Blankclip(length = 1)
writefile(clip, filename, "differenceCount", append=false, flush=true)