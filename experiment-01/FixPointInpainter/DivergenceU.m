%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The subroutine for computing the divergent of a vector field
% over the image domain [1,N]x[1,N] with Neumann BCs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function divGU = DivergenceU(ux,uy)
    h = 1;
    [height,width] = size(ux);
    ux = [zeros(1,width);ux];
    ax = (ux(2:height+1,:)-ux(1:height,:))/h;
    uy = [zeros(height,1) uy];
    by = (uy(:,2:width+1)-uy(:,1:width))/h;
    divGU = ax+by;