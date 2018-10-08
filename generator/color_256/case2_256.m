M = 256;
[X1,X2,color_layer] = meshgrid(1:M,1:M,1:3);  
image = 50*ones(M,M,3); 
image((X1-M/2).^2 + (X2-M/2).^2 < (M/3)^2) = 100;
% outer circle
image(color_layer == 1 & ((X1-M/2).^2 + (X2-M/2).^2 < (M/3)^2)) = 239;
image(color_layer == 2 & ((X1-M/2).^2 + (X2-M/2).^2 < (M/3)^2)) = 186;
image(color_layer == 3 & ((X1-M/2).^2 + (X2-M/2).^2 < (M/3)^2)) = 192;
% mid circle
image(color_layer == 1 & ((X1-M/2).^2 + (X2-M/2).^2 < (M/4)^2)) = 236;
image(color_layer == 2 & ((X1-M/2).^2 + (X2-M/2).^2 < (M/4)^2)) = 80;
image(color_layer == 3 & ((X1-M/2).^2 + (X2-M/2).^2 < (M/4)^2)) = 89;
% inner circle
image(color_layer == 1 & ((X1-M/2).^2 + (X2-M/2).^2 < (M/6)^2)) = 196;
image(color_layer == 2 & ((X1-M/2).^2 + (X2-M/2).^2 < (M/6)^2)) = 0;
image(color_layer == 3 & ((X1-M/2).^2 + (X2-M/2).^2 < (M/6)^2)) = 53;
imwrite(uint8(image),'case2_original.png');
image(32:M-32,M/2-8:M/2+8,:) = 255;
imwrite(uint8(image),'case2_toinpaint.png');
domain = zeros(M,M);
domain(32:M-32,M/2-8:M/2+8) = 255;
imwrite(uint8(domain),'case2_inpaintdomain.png')