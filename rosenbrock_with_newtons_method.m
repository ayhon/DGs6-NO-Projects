a = 1;
b = 100;
%x0 = [-1.2; 1];
x0 = [1.1; 1];

condition_number = @(mat) max(eig(mat)) / min(eig(mat));

grad_ = @(x,y)[-2*(a-x)-4*b*x*(y-x^2);2*b*(y-x^2)];
grad = @(v) grad_(v(1),v(2));
% 2-4*b*(y-3*x^2)

hess_ = @(x,y)[12*b*x^2 - 4*b*y + 2, -4*b*x; -4*b*x, 2*b];
hess = @(v,u) hess_(v(1),v(2));

newtons_method(grad,hess_inv, x0)