function x_min = gradient_descent(grad, x0, step_size, tolerance, iterations)
% Inputs:
%   func: Function to optimize
%   grad: Gradient of the function to optimize
%   x0: The starting point of the algorithm
%   step_size: The factor by which the gradient is followed in the gradient descent
%       (default is 0.001)
%   tolerance: The value of the gradient's norm which is considered to be close to 0
%       (default is 0.01)
%   iterations: Maximum number of iterations to do
%       (default is 1000).
%
% Result: the minimum value of the given function

  % Default values
  if ~exist('step_size', 'var') || isempty(step_size)
    step_size = .001;
  end
  if ~exist('tolerance', 'var') || isempty(tolerance)
    tolerance = .0001;
  end
  if ~exist('iterations', 'var') || isempty(iterations)
    iterations = 100000;
  end
  
  xk = x0;
  
  % Iterate to improve our guess
  for k = 1:iterations
    direction = -grad(xk);
    xk = xk + step_size * direction;
    if norm(direction) <= tolerance
      break;
    end
  end
  x_min = xk;
end