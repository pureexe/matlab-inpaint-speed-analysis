%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The subroutine for computing the image gradient
% over the image domain [1,N]x[1,N] with Neumann BCs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ux,uy] = GradiantU(u) 
    h = 1;
    [height,width] = size(u);
    %disp(size(diff(u)))
    %disp(width)
    ux = [diff(u);zeros(1,width)]/h;
    uy = diff(u')';
    uy = ([uy zeros(height,1)])/h;
