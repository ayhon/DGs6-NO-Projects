%% Testing values
K = 3;
P = [ 1/2  1/2 ;
      1/2 -1/2 ;
     -1/2  1/2 ;
     -1/2 -1/2 ]';
stars = [ 0 -1/2 ;
          0  1/2 ]';
y = [ .25; .25; .25; .25 ];
X = rand(2,K)-.5;
Y = rand(2,K)-.5;
t = rand();
%% Check gradients
K = randi(20);
n = randi(6);
X = rand(2,K)/2;
U = rand(2,K);
P = rand(2,n^2);
checkgradient(@(x)h(x),X(:,1),U(:,1));
checkgradient(@(x)phi(x,P),X(:,1),U(:,1));
checkderivative(@(X,U)Phi(X,U,P),X,U);
%%
if (f((1-t)*X + t*Y,P,y) <= (1-t)*f(X,P,y) + t*f(Y,P,y))
    fprintf("The function f is not convex since for\n")
    X
    Y
    fprintf("it breaks the convexity condition:\n")
    fprintf("f((1-t)*X + t*Y,P,y) <= (1-t)*f(X,P,y) + t*f(Y,P,y)")
end

%% Question 3
D_h = @(x) -x*2/sigma^2 .* h(x);
% 2  →  2

D_phi = @(x,P) D_h(vec_minus(P,x))';
% 2, 2⨉n²  →  n²⨉2

%checkgradient(h, D_h, [1;1],[1;1])
checkgradient(@(x)phi(x,P), @(x)D_phi(x,P), [1;1],[1;1])
