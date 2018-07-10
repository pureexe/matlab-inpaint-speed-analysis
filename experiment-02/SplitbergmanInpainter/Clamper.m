% Clamping Tecnique
% please see https://en.wikipedia.org/wiki/Clamping_(graphics) 
function result = Clamper(data,row,col)
    [height,width] = size(data);
    if row < 1
        row = 1;
    elseif row > height
        row = height;
    end
    if col < 1
        col = 1;
    elseif col > width
        col = width;
    end
    result = data(row,col);
end