function [phi_x,grad_phi_x] = phi(x,P,sigma)
%H Summary of this function goes here
%   phi(x,P): 2, 2·n² → n²
% D_phi(x,P): 2, 2·n² → n²·2
if ~exist('sigma', 'var') || isempty(sigma)
    sigma = .1;
end
n2 = size(P,2);
vec_minus = @(A,B) reshape(permute(A, [1 3 2]) - B, size(A,1), []);
subs = vec_minus(P,x);
[h_i, D_h_i] = h(subs,sigma);
phi_x = h_i';
grad_phi_x = -D_h_i;
end

