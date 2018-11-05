clc;clear;close all;
test_case_number = 3;
inpaint_domain = imread(sprintf('256x256/case%d_inpaintdomain.png',test_case_number));
original_image = imread(sprintf('256x256/case%d_original.png',test_case_number));
toinpaint_image = imread(sprintf('256x256/case%d_toinpaint.png',test_case_number));
% inpaint_domain = inpaint_domain < 1;
inpaint_domain = double(inpaint_domain);
original_image = double(original_image) / 255;
toinpaint_image = double(toinpaint_image) / 255;

lambda = 250;
theta = 5;
tolerant = 5*1e-4;
max_iteration = 100;

tic;
result_image = RecursiveInpainter(toinpaint_image,inpaint_domain,lambda,...
     theta,tolerant,max_iteration,4,1);
toc

disp("RMSE: Recursive Splitbergman")
disp(sqrt(mean((result_image(:) - original_image(:)).^2))); 
disp("PSNR: Recursive Splitbergman");
disp(psnr(result_image,original_image));
imshow(result_image)

%tic;
%result_image = SplitBergmanInpainter(toinpaint_image,lambda * (inpaint_domain <1),...
%    theta,tolerant,1,1,max_iteration);
%toc
%disp("RMSE: Splitbergman")
%disp(sqrt(mean((result_image(:) - original_image(:)).^2))); 
%disp("PSNR: Splitbergman");
%disp(psnr(result_image,original_image));

