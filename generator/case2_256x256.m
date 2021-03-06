felixM = 256;
[X1,X2] = meshgrid(1:M,1:M);  
image = 50*ones(M,M); 
image((X1-M/2).^2 + (X2-M/2).^2 < (M/3)^2) = 100;%Circle
image((X1-M/2).^2 + (X2-M/2).^2 < (M/4)^2) = 150;%Circle
image((X1-M/2).^2 + (X2-M/2).^2 < (M/6)^2) = 200;%Circle
imwrite(uint8(image),'case2_original.png');
image(32:M-32,M/2-8:M/2+8) = 255;
imwrite(uint8(image),'case2_toinpaint.png');
domain = zeros(M,M);
domain(32:M-32,M/2-8:M/2+8) = 255;
imwrite(uint8(domain),'case2_inpaintdomain.png')