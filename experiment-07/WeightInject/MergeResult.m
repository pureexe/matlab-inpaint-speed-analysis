function result_image = MergeResult(original_image,inpainted_domain,upscale_image)
    [height,width] = size(original_image);
    result_image = original_image;
    for i = 1:height
        for j = 1:width
            if inpainted_domain(i,j) ~= 0
                result_image(i,j) = upscale_image(i,j);
            end
        end
    end
end