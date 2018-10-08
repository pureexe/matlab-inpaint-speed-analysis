#############################################################################################################################
#                                  HARDCODED SUBTITLE and LOGO REMOVAL by Skier70                                           #
#   You can use this script to remove hard coded subtitles or Logos.                                                        #
#                                                                                                                           #
#   All you need to do is to;                                                                                               #
#   1) Edit the Virtualdub plugin direcotry path in LINE 1 and LINE 2 according to your computer.                           #
#   2) Check your video, find a suitable scene with the longest subtitle, save the image of the screen,                     #
#   then write down the Top Left Corner coordinates (X and Y) of the longest subtitle. Let's say it is X=238 Y=470.         #
#   Then edit the script line 3 and 4 in order to write those coordinates into the variables                                #
#   SubtitleTopLeftX and SubtitleTopLefty respectively.                                                                     #
#   #3) Then Please replace the text "Pandora (2016).HARDSUB.WEB.HEVC.720p.mp4" in line 5 with your source video name.      #
#                                                                                                                           #
#   LINE 3 SubtitleTopLeftX = 238                                                                                           #
#   LINE 4 SubtitleTopLeftX = 470                                                                                           #
#   LINE 5 clip = FFVideoSource("Pandora (2016).HARDSUB.WEB.HEVC.720p.mp4").ConvertToRGB32()                                #
#                                                                                                                           #
#   4) You can feed this scipt to MeGUI (it's the fastest) and encode your video.                                           #
#   Please note that I have not included audio in this script to keep it simple and trouble free.                           #
#   You can mux the audio afterwards by using any tool like mkvmerge, AviDemux etc.                                         #
#                                                                                                                           #
#############################################################################################################################

LoadVirtualdubplugin("C:\Program Files (x86)\VirtualDub\plugins32\exorcist.vdf", "Exorcist", 1)
LoadVirtualdubplugin("C:\Program Files (x86)\VirtualDub\plugins32\Bright.vdf", "Brightness_Contrast", 1)
SubtitleTopLeftX = 238
SubtitleTopLeftY = 470
clip = FFVideoSource("Pandora (2016).HARDSUB.WEB.HEVC.720p.mp4").ConvertToRGB32()
maskclip = Levels(clip, 111, 10.000, 255, 99, 211)
maskclip = GeneralConvolution(maskclip, 0, "
   10 10 10 10 10
   10 10 10 10 10 
   10 10 10 10 10 
   10 10 10 10 10 
   10 10 10 10 10 ", 256, false)
clip2 = OverLay(clip,maskclip,0,0,mode="subtract")
clip2 = Blur(clip2, 1.58)
clip2 = ConvertToYUY2(clip2)
clip2= Tweak(clip2, hue=-180.0,bright=22,cont=10.0)
maskclip = Crop(clip2, SubtitleTopLeftX,SubtitleTopLeftY,-SubtitleTopLeftX,0).ConvertToRGB32.crop(0,0,0,-2).Trim(0,0)
maskclip = maskclip.Brightness_Contrast(-254, 32) 
maskclip = ConvertToYUY2(maskclip)
maskclip = Tweak(maskclip, hue=-180.0,sat=0.0,bright=22,cont=10.0)
maskclip = ConvertToRGB32(maskclip)
maskclip = maskclip.Levels(0, 0.281, 100, 6, 255)
maskclip = maskclip.Greyscale()
maskclip = maskclip.Exorcist(2, 100) 
maskclip = maskclip.Exorcist(-2, 100) 
maskclip = maskclip.Brightness_Contrast(-21, 32) 
maskclip = GeneralConvolution(maskclip, 0, "
   25 25 25 25 25
   25 25 25 25 25
   25 25 25 25 25
   25 25 25 25 25
   25 25 25 25 25   ", 256, false) 
maskclip = maskclip.Core(116,0)
maskclip = maskclip.Blur(1.58)
clip = dekafka(clip, maskclip, SubtitleTopLeftX, SubtitleTopLeftY, maskclip.width, maskclip.height, 256)
clip = ConvertToYV12(clip)
return clip