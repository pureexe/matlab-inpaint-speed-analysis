addpath('../SplitBergmanInpainter');
toinpaint_image = imread('../../images/256x256/case2_toinpaint.png');
div_image = imread('div.png');
div_data = Divergence(Gradient(toinpaint_image));
grad_image = imread('grad.png');
grad_data = Gradient(toinpaint_image);
imshow(div_data);