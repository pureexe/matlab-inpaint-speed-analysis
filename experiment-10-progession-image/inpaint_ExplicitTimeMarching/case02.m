clc;clear;close all;
image = imread('case2_toinpaint.png');
inpaint_domain = imread('case2_inpaintdomain.png');
original_image = imread('case2_original.png');
original_image = double(original_image) / 255;
inpaint_domain = inpaint_domain < 1;
image = double(image)/255;
inpaint_domain = double(inpaint_domain);


lambda = 250;
beta = 1.0e-6;
tau = 1*1e-5;
tolerent = 1.0e-6;
max_iteration = 1000;
rec = 1;KJ = 100;
lambda = lambda*inpaint_domain;
denoised_image = image;
tic;
[denoised_image,i] = ExplicitTimeMarchingDenoiser(image,lambda,beta,tau,...
    tolerent,max_iteration,rec,KJ);
toc
figure;mesh(denoised_image);
disp("PSNR")
disp(psnr(denoised_image,original_image))
disp("SSIM")
disp(ssim(denoised_image,original_image))
imwrite(denoised_image,'result.png');