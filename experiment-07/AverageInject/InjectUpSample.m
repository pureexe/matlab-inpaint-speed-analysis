function w = InjectUpSample(v)
    %full weighting
    v = double(v);
    [n,m]=size(v);
    
    %Apply 4 Corner
    w(1,1)=v(1,1);  
    w(1,2*m)=v(1,m);
    w(2*n,1)=v(n,1);
    w(2*n,2*m)=v(n,m);
    
    % InnerCase
    for i=1:n-1
        for j=1:m-1
        w(2*i,2*j)=(9*v(i,j)+3*(v(i+1,j)+v(i,j+1))+v(i+1,j+1))/16;
        w(2*i+1,2*j)=(9*v(i+1,j)+3*(v(i,j)+v(i+1,j+1))+v(i,j+1))/16;
        w(2*i,2*j+1)=(9*v(i,j+1)+3*(v(i,j)+v(i+1,j+1))+v(i+1,j))/16;
        w(2*i+1,2*j+1)=(9*v(i+1,j+1)+3*(v(i+1,j)+v(i,j+1))+v(i,j))/16;
        end
    end

    % Edge case (left/right)
    for i=1:n-1
        w(2*i,1)=(12*v(i,1)+4*v(i+1,1))/16;
        w(2*i+1,1)=(12*v(i+1,1)+4*v(i,1))/16;
        w(2*i,2*m)=(12*v(i,m)+4*v(i+1,m))/16;
        w(2*i+1,2*m)=(12*v(i+1,m)+4*v(i,m))/16;   
    end

    % Edge case (top/bottom)
    for j=1:m-1
        w(1,2*j)=(12*v(1,j)+4*v(1,j+1))/16;
        w(1,2*j+1)=(12*v(1,j+1)+4*v(1,j))/16;   
        w(2*n,2*j)=(12*v(n,j)+4*v(n,j+1))/16;  
        w(2*n,2*j+1)=(12*v(n,j+1)+4*v(n,j))/16;
    end
end