% Divergence using Neuman Boundary Condtion
% @params Matrix graidented matrix of image

function result = Divergence(T)
    % data extraction part
    h = 1;
    [total_height,width] = size(T);
    height = total_height/2;
    T1 = T(1:height,:);
    T2 = T(height+1:total_height,:);
    % discrete difference part
    T1 = [zeros(1,height);T1];
    T1 = (T1(2:width+1,:)-T1(1:width,:))/h;
    T2 = [zeros(width,1) T2];
    T2 = (T2(:,2:height+1)-T2(:,1:height))/h;
    result = T1+T2;
end