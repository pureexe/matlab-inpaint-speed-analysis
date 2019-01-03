clc;clear;close all;
[image,inpaint_domain] = createInpaintBar();
inpaint_domain = inpaint_domain < 1;
image = double(image)/255;
inpaint_domain = double(inpaint_domain);

lambda = 1/1;
beta = 1.0e-4;
tau = 2e-5;
tolerent = 1.0e-8;
max_iteration =50000;
rec = 1;KJ = 100;
lambda = lambda*inpaint_domain;
denoised_image = image;
[denoised_image,i] = ExplicitTimeMarchingDenoiser(image,lambda,beta,tau,...
    tolerent,max_iteration,rec,KJ);
figure;mesh(denoised_image);