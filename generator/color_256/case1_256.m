clc;clear;close all;
image = uint8(zeros(256,256,3));
image(0+32:256-32,128-16:128+16,1) = 255;
image(0+32:256-32,128-16:128+16,2) = 255;
image(0+32:256-32,128-16:128+16,3) = 0;
imwrite(image,'case1_original.png');
image(128-4:128+4,128-16:128+16,1)  = 0;
image(128-4:128+4,128-16:128+16,2)  = 0;
image(128-4:128+4,128-16:128+16,3)  = 0;
imshow(uint8(image))
imwrite(image,'case1_toinpaint.png');
domain = zeros(256,256);
domain(128-4:128+4,128-16:128+16)  = 255;
imwrite(domain,'case1_inpaintdomain.png');
