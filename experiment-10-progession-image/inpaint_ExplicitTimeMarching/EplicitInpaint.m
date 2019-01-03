clc;clear;
addpath('denosing_port')
image = (imread('images/to_inpaint.png'));
image = double(rgb2gray(image));
inpaint_domain = (imread('images/inpaint_domain.png'));
inpaint_domain = double(rgb2gray(inpaint_domain));
inpaint_domain = inpaint_domain < 1;
lambda = 0.008;
beta = 1.0e-2;
tau = 0.1;
tolerent = 1.0e-4;
max_iteration = 5000;
lambda = lambda*inpaint_domain;
denoised_image = ExplicitTimeMarchingDenoiser(image,lambda,beta,tau,tolerent,max_iteration);
imshow(uint8(denoised_image));
