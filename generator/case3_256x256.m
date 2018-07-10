clc;clear;close all;
image = zeros(256,256);
image(:,1:32) = 32;
image(:,33:65) = 64;
image(:,65:96) = 96;
image(:,97:128) = 128;
image(:,129:160) = 160;
image(:,161:192) = 192;
image(:,193:224) = 224;
image(:,225:256) = 256;
imwrite(uint8(image),'case3_original.png');
M = 256;
[X1,X2] = meshgrid(1:M,1:M);  
to_inpaint = image;
domain = 0*ones(M,M); 
domain((X1-M/2).^2 + (X2-M/2).^2 < (M/6)^2) = 255;%Circle
to_inpaint((X1-M/2).^2 + (X2-M/2).^2 < (M/6)^2) = 255;
imwrite(uint8(domain),'case3_inpaintdomain.png');
imwrite(uint8(to_inpaint),'case3_toinpaint.png');