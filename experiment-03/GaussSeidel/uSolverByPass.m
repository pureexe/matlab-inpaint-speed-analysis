% solve u subproblem using neuman bondary condition
% this code using clamping tecnique to implement neuman bondary condition
function u = uSolverByPass(u,w,original_image,b,lambda,theta,omega,max_gauss_seidel)
  [height,width] = size(u);
  divergence = Divergence(w-b);
  for k = 1:max_gauss_seidel
    for i = 2:height-1
        for j = 2:width-1
            if lambda(i,j) == 0
                u(i,j) = uGaussKernel(u(i,j),original_image(i,j),lambda(i,j),theta,divergence(i,j),omega,u(i,j-1), u(i,j+1),u(i-1,j),u(i+1,j));
            end
        end
    end
  end
end