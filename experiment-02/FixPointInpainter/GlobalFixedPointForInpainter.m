%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A MATLAB code to demonstrate the GFP-SOR method for 
% Total Variation denoising model (ROF model)
%
% Min { Tv(u) + (1/2)*lambda*int(u-z)^2 } (*)
%  u
%
% This is equaivalent to solve the following PDE:
%
% -*div[Grad(u)/|Grad(u)|]+lambda*(u-z) = 0
%
% Here u is the image to be recovered 
%      z is the observed image corrupted by the Gaussian noise 
% and  
%      alpha > 0 is the regularization parameter.
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [u] = GlobalFixedPointForInpainter(u,z,lambda,beta,omega,GSiter,debug) 
    [n,m] = size(u);
    h = 1;
    D = CoefficientD(u,beta);
    G = z;
    for iter=1:GSiter
        timer_counter = cputime;
        if debug == true
            disp(sprintf('inside loop:'));
        end
        u(1,1) = (1-omega)*u(1,1)+...
            omega*(lambda(1,1)*G(1,1)+(1/h^2)*(D(1,1)*(u(2,1)+u(1,2))))...
            /(lambda(1,1)+(1/h^2)*(2*D(1,1)));
        if n>2
            for i=2:n-1
                u(i,1) = (1-omega)*u(i,1)+...
                    omega*(lambda(i,1)*G(i,1)+(1/h^2)*(D(i,1)*(u(i+1,1)+u(i,2))+D(i-1,1)*u(i-1,1)))...
                    /(lambda(i,1)+(1/h^2)*(2*D(i,1)+D(i-1,1)));
            end
        end
        u(n,1) = (1-omega)*u(n,1)+...
            omega*(lambda(n,1)*G(n,1)+(1/h^2)*(D(n,1)*(u(n,2))+D(n-1,1)*u(n-1,1)))...
            /(lambda(n,1)+(1/h^2)*(D(n,1)+D(n-1,1)));
        if m>2
            for j=2:m-1
                u(1,j) = (1-omega)*u(1,j)+...
                    omega*(lambda(1,j)*G(1,j)+(1/h^2)*(D(1,j)*(u(2,j)+u(1,j+1))+D(1,j-1)*u(1,j-1)))...
                    /(lambda(1,j)+(1/h^2)*(2*D(1,j)+D(1,j-1)));
                for i=2:n-1    
                    u(i,j) = (1-omega)*u(i,j)+omega*(lambda(i,j)*G(i,j)+(1/h^2)*...
                        (D(i,j)*(u(i+1,j)+u(i,j+1))+D(i-1,j)*u(i-1,j)+D(i,j-1)*u(i,j-1)))/...
                        (lambda(i,j)+(1/h^2)*(2*D(i,j)+D(i-1,j)+D(i,j-1)));
                end
                u(n,j) = (1-omega)*u(n,j)+...
                    omega*(lambda(n,j)*G(n,j)+(1/h^2)*(D(n,j)*(u(n,j+1))+D(n-1,j)*u(n-1,j)+D(n,j-1)...
                    *u(n,j-1)))/(lambda(n,j)+(1/h^2)*(D(n,j)+D(n-1,j)+D(n,j-1)));
            end
        end
        u(1,m) = (1-omega)*u(1,m)+...
            omega*(lambda(1,m)*G(1,m)+(1/h^2)*(D(1,m)*(u(2,m))+D(1,m-1)...
            *u(1,m-1)))/(lambda(1,m)+(1/h^2)*(D(1,m)+D(1,m-1)));
        if n>2
            for i=2:n-1
                u(i,m) = (1-omega)*u(i,m)+...
                    omega*(lambda(i,m)*G(i,m)+(1/h^2)*(D(i,m)*(u(i+1,m))+D(i-1,m)*u(i-1,m)+D(i,m-1)...
                    *u(i,m-1)))/(lambda(i,m)+(1/h^2)*(D(i,m)+D(i-1,m)+D(i,m-1)));
            end
        end
        u(n,m) = (1-omega)*u(n,m)+...
            omega*(lambda(n,m)*G(n,m)+(1/h^2)*(D(n-1,m)*u(n-1,m)+D(n,m-1)...
            *u(n,m-1)))/(lambda(n,m)+(1/h^2)*(D(n-1,m)+D(n,m-1)));
        totaltime = cputime - timer_counter;
        if debug == true
            disp(sprintf('inside loop time: %f',totaltime));
        end
    end
end