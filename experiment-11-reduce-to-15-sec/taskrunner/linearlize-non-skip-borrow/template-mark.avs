caseNumber = @CASE@
Original = import("../../avs/raw/original.avs")
Subbed = Original.Textsub("../../avs/subtitle/case@CASE@/@LANGUAGE@.ass", FPS=FPS)

return Subbed