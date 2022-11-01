function x_min = trust_regions_method(func, grad, hess, max_radius, threshold, maxiter)
%TRUST_REGIONS_METHOD Summary of this function goes here
%   Detailed explanation goes here
  if ~exist('max_radius', 'var') || isempty(max_radius)
    max_radius = 100000;
  end  
  if ~exist('threshold', 'var') || isempty(threshold)
    threshold = .1;
  end
  if ~exist('maxiter', 'var') || isemtpy(maxiter)
    maxiter = 1000;
  end
  
  for k = 1:maxiter
      %TODO
      ...
  end
end

