domain = imread('case3_inpaintdomain.png');
to_inpaint = imread('case3_toinpaint.png');
imshow(to_inpaint .* uint8(domain == 0));
