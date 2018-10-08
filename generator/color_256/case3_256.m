clc;clear;close all;
image = uint8(zeros(256,256,3));
% Red
image(:,1:32,1) = 255;
image(:,1:32,2) = 0;
image(:,1:32,3) = 0;
% Orange
image(:,33:65,1) = 255;
image(:,33:65,2) = 99;
image(:,33:65,3) = 0;
% Yellow
image(:,65:96,1) = 255;
image(:,65:96,2) = 255;
image(:,65:96,3) = 0;
%green
image(:,97:128,1) = 0;
image(:,97:128,2) = 128;
image(:,97:128,3) = 0;
%light blue
image(:,129:160,1) = 0;
image(:,129:160,2) = 255;
image(:,129:160,3) = 255;
%blue
image(:,161:192,1) = 0;
image(:,161:192,2) = 0;
image(:,161:192,3) = 255;
% purple
image(:,193:224,1) = 128;
image(:,193:224,2) = 50;
image(:,193:224,3) = 255;
% white
image(:,225:256,:) = 128;

imwrite(image,'caseB_original.png');
M = 256;
[X1,X2] = meshgrid(1:M,1:M);  
domain = 0*uint8(ones(M,M)); 
domain((X1-M/2).^2 + (X2-M/2).^2 < (M/6)^2) = 255;%Circle
[X1,X2,color_layer] = meshgrid(1:M,1:M,1:3);  
to_inpaint = image;
to_inpaint((X1-M/2).^2 + (X2-M/2).^2 < (M/6)^2) = 255;

imwrite(domain,'caseB_inpaintdomain.png');
imwrite(to_inpaint,'caseB_toinpaint.png');