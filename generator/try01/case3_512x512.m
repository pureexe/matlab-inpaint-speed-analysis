clc;clear;close all;
image = zeros(512,512);
image(:,1:64) = 32;
image(:,65:128) = 64;
image(:,129:192) = 96;
image(:,193:256) = 128;
image(:,257:320) = 160;
image(:,321:384) = 192;
image(:,385:448) = 224;
image(:,449:512) = 256;
imwrite(uint8(image),'case3_original.png');
M = 512;
[X1,X2] = meshgrid(1:M,1:M);  
to_inpaint = image;
domain = 0*ones(M,M); 
domain((X1-M/2).^2 + (X2-M/2).^2 < (M/6)^2) = 255;%Circle
to_inpaint((X1-M/2).^2 + (X2-M/2).^2 < (M/6)^2) = 255;
imwrite(uint8(domain),'case3_inpaintdomain.png');
imwrite(uint8(to_inpaint),'case3_toinpaint.png');