%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The subroutine for computing coeffocients D for TV denosing
% over the image domain [1,N]x[1,N]
function [D]=CoefficientD(image,beta)
     h = 1;
 [height,width] = size(image);
    ux = diff(image);
    ux = [ux;zeros(1,width)]/h;
    uy = (diff(image'))';
    uy = [uy zeros(height,1)]/h;
     D = 1./((sqrt(ux.^2+uy.^2+beta)));
