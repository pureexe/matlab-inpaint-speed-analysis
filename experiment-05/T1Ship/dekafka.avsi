function dekafka(clip clip, clip logo1FrameAVI, int Xstart, int Ystart, int X, int Y, int Amount)
{
ytop = Ystart
ybot = Ystart + Y
xleft = Xstart
xright = Xstart + X
topline    = clip.Crop(Xstart,ytop-2,X,2)
bottomline = clip.Crop(Xstart,ybot  ,X,2)
leftline  = clip.Crop(xleft-2, ytop, 2, Y)
rightline = clip.Crop(xright,  ytop, 2, Y)
blurbox_hor = StackVertical  (topline, bottomline).Blur(0, 1.58).BilinearResize(X, Y)
blurbox_ver = StackHorizontal(leftline, rightline).Blur(1.58, 0).BilinearResize(X, Y)
amountYoverX = (Y>=2*X) ? 255 : 128*Y/X # AmountYoverX is small if X >> Y => blurbox_hor is dominant
blurbox  = Layer(blurbox_hor, blurbox_ver, "add", amountYoverX)
logosnap = logo1frameAVI.BilinearResize(X,Y).ConvertToRGB32()
logomask = Mask(blurbox, logosnap)
clip = clip.Layer(logomask,"add",Amount,Xstart,Ystart)
return clip
}