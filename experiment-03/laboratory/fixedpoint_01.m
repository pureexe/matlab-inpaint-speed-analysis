clc;clear;close all;
test_case_number = 4;
inpaint_domain = imread(sprintf('../../images/256x256/case%d_inpaintdomain.png',test_case_number));
original_image = imread(sprintf('../../images/256x256/case%d_original.png',test_case_number));
toinpaint_image = imread(sprintf('../../images/256x256/case%d_toinpaint.png',test_case_number));
inpaint_domain = inpaint_domain < 1;
inpaint_domain = double(inpaint_domain);
original_image = double(original_image) / 255;
toinpaint_image = double(toinpaint_image) / 255;

addpath('../FixPointInpainter');

lambda = 1404;
beta = 1/1000;
tolerant = 1e-6;
max_iteration = 1000;
omega = 1.7;
GSiter = 1;

lambda = lambda*inpaint_domain;

disp('Fixed-point')
disp(sprintf('test case number: %d',test_case_number));
timer_counter = cputime;
inpainted_fixedpoint_image = FixedPointInpainter(toinpaint_image,lambda,beta,omega,GSiter,tolerant,max_iteration,false);
totaltime = cputime - timer_counter;
disp(sprintf('total time: %f',totaltime));
disp('PSNR');
disp(psnr(inpainted_fixedpoint_image,original_image));
imwrite(inpainted_fixedpoint_image,sprintf('case%d_fixpoint.png',test_case_number));