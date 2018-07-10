%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The subroutine for computing the TV operator 
%
% K = div[Grad(u)/Grad(u)]
% 
% over the image domain [1,N]x[1,N]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function answer  = TotalVariation(u,beta)
    [ux,uy] = GradiantU(u);
    normU = sqrt(ux.^2+uy.^2+beta);
    answer  = DivergenceU(ux./normU,uy./normU);
