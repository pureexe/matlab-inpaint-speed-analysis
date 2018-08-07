clc;clear;close all;

addpath('../GaussSeidel');

lambda_constance = 250;
theta = 5;
tolerant = 1e-6;
max_iteration = 10000;
omega = 1;
GSiter = 1;
lab_result = zeros(5,5);

for test_case_number = 1:5
    fprintf("TEST CASE %d:\n",test_case_number);
    inpaint_domain = imread(sprintf('../../images/256x256/case%d_inpaintdomain.png',test_case_number));
    original_image = imread(sprintf('../../images/256x256/case%d_original.png',test_case_number));
    toinpaint_image = imread(sprintf('../../images/256x256/case%d_toinpaint.png',test_case_number));
    inpaint_domain = inpaint_domain < 1;
    inpaint_domain = double(inpaint_domain);
    original_image = double(original_image) / 255;
    toinpaint_image = double(toinpaint_image) / 255;
    lambda = lambda_constance*inpaint_domain;
    tic;
    [inpainted_splitbergman_image,loop] = SplitBergmanInpainter(toinpaint_image,lambda,theta,tolerant,omega,GSiter,max_iteration);
    process_time = toc;
    fprintf("Processed in: %.6f\n",process_time);
    RMSE = sqrt(mean((inpainted_splitbergman_image(:) - original_image(:)).^2));
    PSNR = psnr(inpainted_splitbergman_image,original_image);
    imwrite(inpainted_splitbergman_image,sprintf('result_gauss/case%d.png',test_case_number));
    lab_result(test_case_number,1) = test_case_number;
    lab_result(test_case_number,2) = process_time;
    lab_result(test_case_number,3) = RMSE;
    lab_result(test_case_number,4) = PSNR;
    lab_result(test_case_number,5) = loop;
end

csvwrite('gauss_seidel.csv',lab_result);
% mesh(inpainted_splitbergman_image);