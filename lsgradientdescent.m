function [theta, gradnorms, times] = lsgradientdescent(fhandle, x0, params, lsparams)
% Gradient descent with linesearch to find the step size.
% For this function you can reuse most of your code from the fixed step
% sizes version. The main difference is that you will call 'linesearch' to
% find the step size.

% fhandle: Function handle returning the function value and the gradient at
% a given point.
% x0: Initial point.
% params: Structure containing parameters for algorithm.
% lsparams: Structure containing parameters for the linesearch.

    maxiters = params.maxiters;
    maxtime = params.maxtime;
    tolgradnorm = params.tolgradnorm;
    
    %%% Added by me
    gradnorms = zeros(1, maxiters + 1);
    times = zeros(1, maxiters + 1);

    xk = x0;
    tic
    for iter = 1:maxiters
        [~, max_direction] = fhandle(xk);
        min_direction = -max_direction;
        alpha = linesearch(fhandle,xk,min_direction,lsparams);
        xk = xk + alpha*min_direction;
        
        times(iter) = toc;
        if times(iter) > maxtime
            break
        end

        gradnorms(iter) = norm(min_direction);
        gradnorms(iter)
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