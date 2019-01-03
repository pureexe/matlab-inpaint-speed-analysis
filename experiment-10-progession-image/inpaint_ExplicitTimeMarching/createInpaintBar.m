function [image,inpaint_domain] = createInpaintBar()
    image = zeros(64,64);
    image(15:30,28:36) = 204;
    image(34:50,28:36) = 204;
    inpaint_domain = zeros(64,64);
    inpaint_domain(31:33,28:36) = 255;
    image = uint8(image);
    inpaint_domain = uint8(inpaint_domain);