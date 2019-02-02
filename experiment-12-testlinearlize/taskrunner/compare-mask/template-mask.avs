caseNumber = @CASE@
Original = import("original.avs")
Blank = BlankClip(Original)
Subbed = Blank.Textsub("../../avs/subtitle_mask/case@CASE@/@LANGUAGE@.ass", FPS=FPS)
return Subbed.Crop(280,(caseNumber - 1)*144+37,720,70)