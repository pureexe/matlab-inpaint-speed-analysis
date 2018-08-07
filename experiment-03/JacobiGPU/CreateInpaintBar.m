function [image,inpaint_domain] = CreateInpaintBar(height,width,bar_height,bar_width,abyss_thick)
    image = zeros(height,width);
    image(height/2 - bar_height - abyss_thick:height/2 - abyss_thick-1,width/2 - bar_width/2:width/2 + bar_width/2) = 204;
    image(height/2 +abyss_thick+1:height/2 + abyss_thick + bar_height,width/2 - bar_width/2:width/2 + bar_width/2) = 204;
    inpaint_domain = zeros(height,width);
    inpaint_domain(height/2 - abyss_thick:height/2 + abyss_thick,width/2 - bar_width/2:width/2 + bar_width/2) = 204;
    image = uint8(image);
    inpaint_domain = uint8(inpaint_domain);