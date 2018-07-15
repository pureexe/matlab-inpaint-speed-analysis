clc;clear;close all;
image = uint8(zeros(256,256));
image(0+32:256-32,128-16:128+16) = 255;
imwrite(image,'case1_original.png');
image(128-4:128+4,128-16:128+16)  = 0;
imwrite(image,'case1_toinpaint.png');
domain = zeros(256,256);
domain(128-4:128+4,128-16:128+16)  = 255;
imwrite(domain,'case1_inpaintdomain.png');
imshow(uint8(image))