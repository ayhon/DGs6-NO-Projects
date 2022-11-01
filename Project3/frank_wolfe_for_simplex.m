function x, mu, s = frank_wolfe_for_simplex(n, A, b, x_0, maxiter, tolerance)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  if ~exists('g', 'maxiter') || isempty(maxiter) do
    maxiter = 10000;
  end
  if ~exists('g', 'tolerance') || isempty(maxiter) do
    maxiter = 0.001;
  end
  
  optimal_mu = @(A,b,x,y) dot(y-x, A*x-b) / norm(y-x)^2;
  frank_wolfe_gap = @(A,b,xk,sk) dot(a*xk - b, xk - sk)
  x =  zeros(maxiter+1)
  mu = zeros(maxiter)
  s =  zeros(maxiter)
  
  
  for k = 1:maxiter 
    s(k) = simplex_argmin_linear(n, A*x(k) - b);
    mu(k) = optimal_mu(A,b,x(k),s(k));
    x(k+1) = (1-mu(k)) * x(k) + m(k) * s(k);
    
    if(frank_wolfe_gap(A,b,x(k),s(k)) < tolerance)
      break
    end
  end
end

function x = simplex_argmin_linear(n,w)
  x = zeros(n);
  k = argmin(w);
  x(k) = 1;
end