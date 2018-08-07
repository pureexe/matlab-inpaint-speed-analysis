%% **section 1:** intial test image
% clear all previous run variable and windows
clc;clear;close all;
%create image
%[image,inpaint_domain] =  CreateInpaintBar(64,64,20,10,2);
[image,inpaint_domain] =  CreateInpaintBar(256,256,80,40,8);
%[image,inpaint_domain] =  CreateInpaintBar(512,512,160,80,16);
%change image domain [0 - 255] to [0 - 1]
original_image = double(image+inpaint_domain)/255;
inpaint_domain = inpaint_domain < 1;
image = double(image)/255;
inpaint_domain = double(inpaint_domain);

%% ** section 2:** testing
lambda = 250/1;
theta = 5; % in publication use little gamma insted
max_gauss_seidel = 10;
tolerant = 1e-6;
max_iteration = 1000; % force stop compute if iteration exceed to prevent forever loop

%merge lambda with inpaint domain
lambda = lambda * inpaint_domain;

tic;
inpainted_splitbergman_image = SplitBergmanInpainter(image,lambda,theta,tolerant,max_gauss_seidel,max_iteration);
toc %processed time measurement

disp('RMSE ')
disp(sqrt(mean((inpainted_splitbergman_image(:) - original_image(:)).^2))); 
disp('PSNR')
disp(psnr(inpainted_splitbergman_image,original_image))

mesh(inpainted_splitbergman_image)