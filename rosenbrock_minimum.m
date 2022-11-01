function [minimum] = rosenbrock_minimum(a, b, x0, step_size, tolerance, iterations)
% Inputs:
%   Parameters a and b of the Rosenbrock function.
%   step_size: The factor by which the gradient is followed in the gradient descent
%       (default is 1)
%   tolerance: The value of the gradient's norm which is considered to be close to 0
%       (default is 0.01)
%   iterations: Maximum number of iterations to do
%       (default is 1000).
%
% Result: the minimum value of the Rosenbrock function with parameters a,b

  % Define the relevant Rosenbrock function and its gradient
  func = @(x,y) (a-x)^2 + b*(y-x^2)^2;
  grad = @(x,y) [
    -2*(a-x) + 2*b*(y-x^2)*(-2);
    2*b*(y-x^2)
  ];
  
  minimum = gradient_descent(func, grad, x0, step_size, tolerance, iterations);
end