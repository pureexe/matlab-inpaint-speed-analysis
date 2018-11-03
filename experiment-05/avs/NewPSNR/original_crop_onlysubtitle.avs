import("../OnlySubtitleFrame.avs")
Thai = import("../subtitle_thai.avs")
Original = import("../Original.avs")
Thai_Crop = Thai.Crop(280,620,720,70)
Original_Crop = Original.Crop(280,620,720,70)

SubtitleFrame = OnlySubtitleFrame(Original_Crop,Thai_Crop)
return SubtitleFrame