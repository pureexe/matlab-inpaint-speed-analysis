clc;clear;close all;
test_case_number = 2;
inpaint_domain = imread(sprintf('../../images/256x256/case%d_inpaintdomain.png',test_case_number));
original_image = imread(sprintf('../../images/256x256/case%d_original.png',test_case_number));
toinpaint_image = imread(sprintf('../../images/256x256/case%d_toinpaint.png',test_case_number));
inpaint_domain = inpaint_domain < 1;
inpaint_domain = double(inpaint_domain);
original_image = double(original_image) / 255;
toinpaint_image = double(toinpaint_image) / 255;

addpath('../SplitBergmanInpainter');

lambda = 250;
theta = 5;
tolerant = 1e-6;
max_iteration = 10000;
omega = 1;
GSiter = 1;

lambda = lambda*inpaint_domain;

disp('Split Bergman')
disp(sprintf('test case number: %d',test_case_number));
timer_counter = cputime;
inpainted_splitbergman_image = SplitBergmanInpainter(toinpaint_image,lambda,theta,tolerant,omega,GSiter,max_iteration);
totaltime = cputime - timer_counter;
disp(sprintf('total time: %f',totaltime));
disp('RMSE ')
disp(sqrt(mean((inpainted_splitbergman_image(:) - original_image(:)).^2)));
disp('PSNR');
disp(psnr(inpainted_splitbergman_image,original_image));
imwrite(inpainted_splitbergman_image,sprintf('case%d_splitbergman.png',test_case_number));
% mesh(inpainted_splitbergman_image);