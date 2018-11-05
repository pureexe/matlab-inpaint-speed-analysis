function w = BilinearUpSample(v)
    %Injection
    [n,m]=size(v);
    w=zeros(2*n,2*m);
    for i=1:n
        for j=1:m   
            w(2*i,2*j)=v(i,j);
            w(2*i,2*j-1)=v(i,j);
            w(2*i-1,2*j)=v(i,j);
            w(2*i-1,2*j-1)=v(i,j);
        end
    end
end