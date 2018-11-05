function w = WeightDownSample(u)
    [n,m]=size(u);
    v = wextend(2,'sym',u,1);
    w = zeros(n/2,m/2);
    v = double(v);
    for i=1:n/2
        for j=1:m/2
            w(i,j)=(9*(v(2*i+1,2*j+1)+v(2*i+1,2*j)+v(2*i,2*j+1)+v(2*i,2*j))+3*(v(2*i,2*j-1)...
                + v(2*i+1,2*j-1)+v(2*i+2,2*j)+v(2*i-1,2*j)+v(2*i+2,2*j+1)+...
                v(2*i-1,2*j+1)+v(2*i,2*j+2)+v(2*i+1,2*j+2))+v(2*i+2,2*j+2)+v(2*i+2,2*j-1)+...
                v(2*i-1,2*j+2)+v(2*i-1,2*j-1))/64;
        end
    end
end
