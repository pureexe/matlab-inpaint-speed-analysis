function w = AverageDownSample(u)
    [n,m]=size(u);
    u = double(u);
    w=zeros(n/2,m/2);
    for i=1:n/2
        for j=1:m/2
            w(i,j)=(u(2*i,2*j)+u(2*i,2*j-1)+u(2*i-1,2*j)+u(2*i-1,2*j-1))/4;
        end
    end
end
