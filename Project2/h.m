function [h_x,grad_h_x] = h(x,sigma)
%   h(x): 2 → 1
% D_h(x): 2 → 2
if ~exist('sigma', 'var') || isempty(sigma)
    sigma = .1;
end
h_x = exp(-vecnorm(x).^2/sigma^2);
grad_h_x = -2*h_x/sigma^2 .* x;
end