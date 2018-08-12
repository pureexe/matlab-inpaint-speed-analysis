% solve u subproblem using neuman bondary condition
% this code using jacobi technique
function u = uSolver(u,w,original_image,b,lambda,theta,omega,max_gauss_seidel)
    divergence = Divergence(w-b);    
    [height,width] = size(u);   
    for k = 1:max_gauss_seidel
        % red step % $mod(row+col,2) == 1$
        lapacian = imfilter(u,[0,1,0;1,0,1;0,1,0],'replicate');
        row = 1:2:height;
        col = 2:2:width;
        u(row,col) = (1-omega)*u(row,col) + omega*((1 ./ (lambda(row,col) + 4*theta)) .* (lambda(row,col) .*original_image(row,col) - theta .* divergence(row,col) + theta .* lapacian(row,col)));
        row = 2:2:height;
        col = 1:2:width;
        u(row,col) = (1-omega)*u(row,col) + omega*((1 ./ (lambda(row,col) + 4*theta)) .* (lambda(row,col) .*original_image(row,col) - theta .* divergence(row,col) + theta .* lapacian(row,col)));
        % black step % $mod(row+col,2) == 0$
        lapacian = imfilter(u,[0,1,0;1,0,1;0,1,0],'replicate');
        row = 1:2:height;
        col = 1:2:height;
        u(row,col) = (1-omega)*u(row,col) + omega*((1 ./ (lambda(row,col) + 4*theta)) .* (lambda(row,col) .*original_image(row,col) - theta .* divergence(row,col) + theta .* lapacian(row,col)));
        row = 2:2:height;
        col = 2:2:height;
        u(row,col) = (1-omega)*u(row,col) + omega*((1 ./ (lambda(row,col) + 4*theta)) .* (lambda(row,col) .*original_image(row,col) - theta .* divergence(row,col) + theta .* lapacian(row,col)));
    end
end