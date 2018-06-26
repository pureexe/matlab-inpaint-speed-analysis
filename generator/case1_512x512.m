clc;clear;close all;
image = uint8(zeros(512,512));
image(0+64:512-64,256-32:256+32) = 255;
imwrite(image,'case1_original.png');
image(256-8:256+8,256-32:256+32) = 127;
imwrite(image,'case1_toinpaint.png');
domain = zeros(512,512);
domain(256-8:256+8,256-32:256+32) = 255;
imwrite(domain,'case1_inpaintdomain.png');
imshow(uint8(image))