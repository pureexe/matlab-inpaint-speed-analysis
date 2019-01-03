caseNumber = @CASE@
top = (caseNumber - 1)*144+37
bottom = top + 70

Original = import("../../avs/raw/original.avs")
import("../../avs/raw/OnlySubtitleFrame.avs")


Subbed = Original.Textsub("../../avs/subtitle/case@CASE@/@LANGUAGE@.ass", FPS=FPS)

Subbed_Crop = Subbed.Crop(280,top,720,70)
Original_Crop = Original.Crop(280,top,720,70)

SubtitleFrame = OnlySubtitleFrame(Original_Crop,Subbed_Crop)
return SubtitleFrame