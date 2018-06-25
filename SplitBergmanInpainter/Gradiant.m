%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The subroutine for computing the image gradient
% over the image domain [1,N]x[1,N] with Neumann BCs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function G = Gradiant(u) 
    [height,width] = size(u);
    ux = [u(2:height,:);u(1,:)];
   uy = [u(:,2:width) u(:,1)];
pd_ux = ux-u;
pd_uy = uy-u;
G = [pd_ux;pd_uy];

