clc;clear;close all;

addpath('../AverageInject');
lambda = 250;
theta = 5;
tolerant = 1e-6;
max_iteration = 10000;
omega = 1;
GaussSeidelIteration = 1;
lab_result = zeros(5,6);
for i = 1:5
    fprintf("TEST CASE %d:\n",i);
    test_case_number = i;
    inpaint_domain = imread(sprintf('../../images/256x256/case%d_inpaintdomain.png',test_case_number));
    original_image = imread(sprintf('../../images/256x256/case%d_original.png',test_case_number));
    toinpaint_image = imread(sprintf('../../images/256x256/case%d_toinpaint.png',test_case_number));
    inpaint_domain = double(inpaint_domain);
    original_image = double(original_image) / 255;
    toinpaint_image = double(toinpaint_image) / 255;
    tic;
    result_image = RecursiveInpainter(toinpaint_image,inpaint_domain,lambda,theta,tolerant,max_iteration,4,1);
    process_time = toc;
    RMSE = sqrt(mean((result_image(:) - original_image(:)).^2));
    PSNR = psnr(result_image,original_image);
    SSIM = ssim(result_image,original_image);
    lab_result(i,1) = i;
    lab_result(i,2) = process_time;
    lab_result(i,3) = RMSE;
    lab_result(i,4) = PSNR;
    lab_result(i,5) = SSIM;
    lab_result(i,6) = splitbergman_loopcount;
end
csvwrite('AverageInject.csv',lab_result);