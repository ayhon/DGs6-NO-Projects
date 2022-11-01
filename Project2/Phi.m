function [Phi_X,D_Phi_X_U] = Phi(X,U,P,sigma)
%H Summary of this function goes here
%   Phi(x,P): 2·K, 2·n²  →  n²
% D_Phi(x,P): 2·K, 2·n² → n²·2
if ~exist('sigma', 'var') || isempty(sigma)
    sigma = .1;
end
if ~exist('V', 'var') || isempty(U)
    U = X;
end

n2 = size(P,2);
K = size(X,2);
vec_minus = @(A,B) reshape(permute(A, [1 3 2]) - B, size(A,1), []);

Phi_X = 0;
D_Phi_X_U = 0;
for k=1:K
    xk = X(:,k);
    uk = U(:,k);
    [phi_xk,grad_phi_k] = phi(xk,P,sigma);
    Phi_X = Phi_X + phi_xk;
    D_Phi_X_U = D_Phi_X_U + grad_phi_k'*uk;
end
end

