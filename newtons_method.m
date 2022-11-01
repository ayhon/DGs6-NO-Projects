function x_min = newtons_method(grad, hess, x0, maxiter)
%NEWTONS_METHOD Summary of this function goes here
%   Detailed explanation goes here
    if ~exist('maxiter', 'var') || isempty(maxiter)
        maxiter = 100;
    end
    xk = x0;
    
    for k = 1:maxiter
        uk = hess(xk) \ (-grad(xk));
        xk = xk + uk;
    end

    x_min = xk;
end

