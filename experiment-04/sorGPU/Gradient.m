% Gradiant with Neuman Boundary Condition
function G = Gradient(u) 
    h = 1;
    [height,width] = size(u);
    ux = [diff(u);zeros(1,height)]/h;
    uy = diff(u')';
    uy = ([uy zeros(width,1)])/h;
    G = [ux;uy];
end