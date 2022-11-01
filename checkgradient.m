function checkgradient(fhandle, theta, v)
% Numerically check if the gradient is correct.

% fhandle: Function handle returning the function value and the gradient at
% a given point.
% theta: Point where to perform the Taylor expansion.
% v: Direction in which to perform the Taylor expansion.

    n = 101;
    ts = logspace(-8, 0, n);
    
    f_theta_tv = fhandle(theta + v*ts);
    [f_theta, grad_f_theta] = fhandle(theta);

    errors = abs(f_theta_tv - f_theta - (v' *grad_f_theta)*ts);
    loglog(ts, errors)
end