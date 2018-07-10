function w = wSolver(u,b,theta)
    gradU = Gradient(u);
    gradB = gradU+b;
    w = max(abs(gradB)-1./theta,0).*sign(gradB);
end
