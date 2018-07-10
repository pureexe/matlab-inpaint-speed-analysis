% lapacian for inpainted using neuman boundary condition
% assume h = 1
function result = Lapacian(u)
    [height,width] = size(u);
    %interior
    for i = 2:height-1
        for j = 2:width-1
            u(i,j) = u(i-1,j) + u(i+1,j) + u(i,j-1) + u(i,j+1);
        end
    end
    % corner
    u(1,1) = u(1,1) + u(1,2) + u(1,1) + u(2,1);  %top-left
    u(1,width) = u(1,width - 1) + u(1,width) + u(1,width) + u(2,width);  %top-right
    u(height,1) = u(height,1) + u(height,2) + u(height - 1,1) + u(height,1); %down-left
    u(height,width) = u(height,width -1) + u(height,width) + u(height -1,width) + u(height,width);%down-right
    %top
    for i = 2:width - 1
        u(1,i) = u(1,i -1) + u(1,i + 1)  + u(1,i)  + u(2,i);
    end
    %left
    for i = 2:height - 1
        u(i,1) = u(i,1) +  u(i,2) + u(i-1,1) + u(i+1,1);
    end
    %right
    for i = 2:width-1
        u(i,width) = u(i,width-1) + u(i,width) + u(i-1,width) + u(i+1,width);
    end
    %down
    for i = 2:height -1
        u(height,i) = u(height,i-1) + u(height,i+1)  + u(height,i-1)  + u(height,i);
    end
end