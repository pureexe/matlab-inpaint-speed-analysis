Original = import("original.avs")
Subbed = Original.Textsub("subtitle/english.ass", FPS=FPS)
return Subbed.Crop(280,620,720,70)