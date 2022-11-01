a = 1;
b = 100;
x0 = [-1.21; 1];

func_ = @(x,y) (a-x)^2 + b(y-x^2)^2;
func = @(v) func_(v(1),v(2));

grad_ = @(x,y)[-2*(a-x)-4*b*x*(y-x^2);2*b*(y-x^2)];
grad = @(v) grad_(v(1),v(2));

gradient_descent(grad, x0)