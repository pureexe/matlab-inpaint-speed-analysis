%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The subroutine for computing coeffocients D for TV denosing
% over the image domain [1,N]x[1,N]
function [D] = CoeffocientD(image,beta)
    h = 1;
    [height,width] = size(image);
    u_x = diff(image);
    u_x = [u_x;zeros(1,height)]/h;
    u_y = (diff(image'))';
    u_y = [u_y zeros(width,1)]/h;
    D = 1./((sqrt(u_x^2+u_y.^2+beta)));
end

