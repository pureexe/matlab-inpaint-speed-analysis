%%
% split bergman inpainter
function u = SplitBergmanInpainter(original_image,lambda,theta,omega,GSiter,tolerant,max_iteration,debug)
    image_norm = 99999999;
    i = 0;
    u = original_image;
    b = Gradiant(u);
    w = b;
    while image_norm > tolerant && i < max_iteration
        timer_counter = cputime;
        if debug == true
            disp(sprintf('loop: %d',i+1));
        end
        last_image = u;
        u = uSolver(w,u,original_image,b,lambda,theta,omega,GSiter,debug); %solve u
        w = wSolver(w,u,b,theta); %solve w
        b = b + Gradiant(u) - w; % update b
        image_norm = norm(last_image(:)-u(:),2)/norm(u(:),2);
        i = i + 1;
        totaltime = cputime - timer_counter;
        if debug == true
            disp(sprintf('loop time: %f',totaltime));
        end
    end
end
