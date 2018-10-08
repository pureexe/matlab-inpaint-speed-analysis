#

#Load Plug-in
LoadPlugin("C:\Program Files (x86)\Konayuki-moe\KONAYUKI PLUS\codecs\filters\FFmpeg\ffms2.dll")

#Apply Filter
Video = FFMS2("C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\resource\thai.mp4", ATrack=-1, fpsnum=24000, fpsden=1001, ColorSpace="YV12", UTF8=True).ConvertToRGB24.ConvertToYV12
Video