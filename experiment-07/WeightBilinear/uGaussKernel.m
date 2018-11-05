function result = uGaussKernel(u,z,lambda,theta,divergence,omega,u_left,u_right,u_above,u_under)
        h = 1;
        lapacian = (1/h^2)*(u_left+u_right+u_above+u_under);
        buffer = lambda*z - theta*divergence+theta*lapacian; 
        u_new = ((h^2)/(lambda*h^2 + 4*theta))*buffer;
        result = (1-omega)*u+omega*u_new;
end