import("../../avs/OnlySubtitleFrame.avs")
Subbed = import("../../avs/english.avs")
Original = import("../../avs/original.avs")
Subbed_Crop = Subbed.Crop(280,620,720,70)
Original_Crop = Original.Crop(280,620,720,70)

SubtitleFrame = OnlySubtitleFrame(Original_Crop,Subbed_Crop)
return SubtitleFrame