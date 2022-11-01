function [theta, gradnorms, times] = cstgradientdescent(fhandle, x0, alpha, params)
    maxiters = params.maxiters;
    maxtime = params.maxtime;
    tolgradnorm = params.tolgradnorm;
    
    gradnorms = zeros(1, maxiters + 1);
    times = zeros(1, maxiters + 1);

    xk = x0;
    tic
    for iter = 1:maxiters
        [~, max_direction] = fhandle(xk);
        min_direction = -max_direction;
        xk = xk + alpha*min_direction;
        
        times(iter) = toc;
        if times(iter) > maxtime
            break
        end

        gradnorms(iter) = norm(min_direction);
        if gradnorms(iter) < tolgradnorm
            break
        end
        if gradnorms(iter) / gradnorms(1) < tolgradnorm
            break
        end
    end
    
    theta = xk;
    gradnorms = gradnorms(1:iter);
    times = times(1:iter);
end