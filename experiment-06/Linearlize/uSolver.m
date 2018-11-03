% solve u subproblem using neuman bondary condition
% this code using clamping tecnique to implement neuman bondary condition
function u = uSolver(u,w,original_image,b,lambda,theta,delta,max_gauss_seidel)
    %h = 1; % discrete lapacian
    %[height,width] = size(u);
    divergence = Divergence(w-b);
    for i = 1:max_gauss_seidel
        lapacian = imfilter(u,[0,1,0;1,-4,1;0,1,0],'replicate');
        g = lambda.*original_image - theta.*divergence + theta.*lapacian;
        u = (u + delta.*g)./( 1+ delta .* lambda);
    end
end