function result_image = RecursiveInpainter(original_image,inpainted_domain,lambda,...
    theta,tolerant,max_iteration,max_step,current_step)
    if current_step < max_step
        half_image = WeightDownSample(original_image);
        half_domain = WeightDownSample(inpainted_domain);
        % assignin('base',sprintf('half_image_%d',current_step),half_image);
        % assignin('base',sprintf('half_domain_%d',current_step),half_domain);        
        half_result = RecursiveInpainter(half_image,half_domain,lambda,...
            theta,tolerant,max_iteration,max_step,current_step+1);
        [height,width] = size(original_image);
        upscale_result = BilinearUpSample(half_result);
        toinpaint_image = MergeResult(original_image,inpainted_domain,upscale_result);
    else
        toinpaint_image = original_image;
    end
    
    %theta = 2^(current_step-1) * theta;
    theta = theta / 2^(current_step-1);
    % lambda = lambda*exp(0.02*(max_step - current_step + 1));
        
    inpainted_lambda =  inpainted_domain < 1;
    inpainted_lambda = inpainted_lambda*lambda;
    
    % assignin('base',sprintf('toinpaint_image_%d',current_step),toinpaint_image);
    if current_step ~= 1
        if current_step == 4
            max_iteration = 100;
            tolerant = 1e-12;
        else
            max_iteration = 10;
            tolerant = 1e-12;
        end        
    end
    result_image = SplitBergmanInpainter(toinpaint_image,inpainted_lambda,theta,tolerant,1,1,max_iteration);
    % assignin('base',sprintf('result_image_%d',current_step),result_image);
end