%w = max(abs(GradB)-alpha/theta,0).*sign(GradB);%Task 6
function w = wSolver(w,u,b,theta)
    gradU = Gradiant(u);
    grad_norm = norm(gradU+b,2);
    w = max(grad_norm-1/theta,0)*(gradU+b)/grad_norm;
end