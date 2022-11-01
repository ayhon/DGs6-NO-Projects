function checkderivative(fhandle, theta, v)
% Numerically check if the gradient is correct.

% fhandle: Function handle returning the function value and the gradient at
% a given point.
% theta: Point where to perform the Taylor expansion.
% v: Direction in which to perform the Taylor expansion.

    n = 101;
    ts = logspace(-8, 8, n);

    [f,gv]=fhandle(theta,v);
    err=zeros(n,1);

    for k=1:n
        bulged = theta+ts(k)*v;
        [f_tk,~]=fhandle(bulged,v);
        errk = norm(f_tk-f-ts(k)*(gv));
        err(k) = errk;
    end

    loglog(ts,err)

    hold on
    loglog(ts,ts.^2)
    title('Plot error of checkderivative')
    legend('$error$', '$t^2$', 'interpreter','latex')

end