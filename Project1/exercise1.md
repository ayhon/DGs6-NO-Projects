# Homework 1: Gradient Descent and Convexity

By Fernando Leal

### Initial definitions

1. $x_i, \dots, x_m \in \mathbb{R}^{n\times n}, X\in\text{Mat}_{m \times n^2}(\mathbb{R})$
2. $\sigma(z) = \frac{1}{1+e^{-z}}$
3. $\theta = (x,b) \in \mathbb{R}^{n\times m}\times \mathbb{R}$
4. $\Pr(y_i \mid x_i, \theta) = \sigma(\left<x_i,x\right> + b)^{y_i}\sigma(-\left<x_i,x\right> - b)^{1-y_i}$
5. $\ell(\theta)=\prod_{i=1}^{m}\Pr(y_i\mid x_i,\theta)$
6. $f:\mathbb{R}^{n\times m + 1}\to\mathbb{R}:\theta\mapsto f(\theta) = -\log(\ell(\theta))$
7. $\tilde{x}_i = (x_i,1)$, a concatenation

### Question 1

> Verify that  
> 
> $$
> f(\theta) = 
\sum_{i=1}^{m}y_i\log(1+e^{-\left<\tilde{x}_i,\theta\right>}) + (1- y_i)\log(1+e^{\left<\tilde{x}_i, \theta\right>})
> $$

$$
\begin{align}
f(\theta) &= -\log(\ell(\theta)) =\\
&= -\log\left(\prod_{i=1}^{m}\Pr(y_i\mid x_i,\theta)\right) =\\
&= -\log\left(\prod_{i=1}^{m}\sigma(\left<\tilde{x}_i,\theta\right>)^{y_i}\sigma(-\left<\tilde{x}_i,\theta\right>)^{1-y_i}\right) =\\
&= -\sum_{i=1}^{m}\log\left(\sigma(\left<\tilde{x}_i,\theta\right>)^{y_i}\sigma(-\left<\tilde{x}_i,\theta\right>)^{1-y_i}\right) =\\
&=-\sum_{i=1}^{m}y_i\log\left(\sigma(\left<\tilde{x}_i,\theta\right>)\right) + (1-y_i)\log\left(\sigma(-\left<\tilde{x}_i,\theta\right>)\right) =\\
&=-\sum_{i=1}^{m}y_i\log\left((1+e^{\left<\tilde{x}_i,\theta\right>})^{-1}\right) + (1-y_i)\log\left((1+e^{-\left<\tilde{x}_i,\theta\right>})^{-1}\right) =\\
&= -\sum_{i=1}^{m}-y_i\log\left(1+e^{\left<\tilde{x}_i,\theta\right>}\right) - (1-y_i)\log\left(1+e^{-\left<\tilde{x}_i,\theta\right>}\right) =\\
&=\ \;\sum_{i=1}^{m}y_i\log\left(1+e^{\left<\tilde{x}_i,\theta\right>}\right) + (1-y_i)\log\left(1+e^{-\left<\tilde{x}_i,\theta\right>}\right)
\end{align}
$$

### Question 2

> Show that $z\mapsto \log(1+e^z)$ is convex

Let $g(z) := \log(1 + e^z)$, then $g'(z) = \frac{e^z}{1+e^z}$ and $g''(z) = \frac{e^z(1+e^z) - e^z(e^z)}{(1+e^z)^2} = \frac{e^z}{(1+e^z)^2}$, for which we see that $\forall x\in\mathbb{R}, g''(z)\ge0$, and therefore $g$ is convex. 

### Question 3

> Show that $f$ is convex

From [Question 1](#question-1) we see that 

$$
\begin{align}
f(\theta) &= \sum_{i=1}^{m}y_i\log\left(1+e^{\left<\tilde{x}_i,\theta\right>}\right) + (1-y_i)\log\left(1+e^{-\left<\tilde{x}_i,\theta\right>}\right) =\\ 
&= \sum^m_{i=1}y_ig(\left<\tilde{x}_i,\theta\right>) + (1-y_i)g(-\left<\tilde{x}_i,\theta\right>)
\end{align}
$$

which is but a non-negative weighted sum of a convex function g composed with the affine mappings $\theta \mapsto \left<\tilde{x}_i,\theta\right>$ and $\theta \mapsto - \left<\tilde{x}_i,\theta\right>$. Since:

1. Composing a convex function with an affine mapping preserves the convexity
2. Doing a non-negative weighted sum of convex functions preserves convexity

Then we have that $f$ is convex.

### Question 4

> Show that $f_\lambda(\theta) := f(\theta) + \frac{\lambda}{2}\lVert \theta \rVert^2$ is strongly convex

$f_\lambda(\theta)$ is $\mu$-strongly convex if $f_\lambda(\theta) - \frac{\mu}{2}\lVert \theta \rVert ^2$ is convex. If we choose $\mu = \lambda$, by the definition of $f_\lambda$ we have
$$
f_\lambda(\theta) - \frac{\lambda}{2}\lVert\theta\rVert^2 = f(\theta) - \frac{\lambda}{2}\lVert\theta\rVert^2 + \frac{\lambda}{2}\lVert\theta\rVert^2 = f(\theta)
$$
which we already know is convex from [Question  3](#question-3)

### Question 5

> With $\lambda  > 0$ argue that $f_\lambda$ has a single global minimum $\theta \in \mathcal{E}$ for which $\nabla f_\lambda(\theta) = 0$

If $\lambda > 0$, we've seen that $f_\lambda$ is strongly convex in [Question 4](#question-4), which means that it must have a global minimum THEOREM_REF, and that such minimum must be a $\theta\in\mathcal{E}$ where $\nabla f_\lambda(\theta) = 0$.

An equivalent condition for $f$ to be strongly convex with parameter $\lambda  > 0$ is that for $x,y$
$$
f(y) \ge f(x) + \left<\nabla  f(x), x-y\right> + \frac{\lambda}{2}\lVert  x -y\rVert^2
$$
With this condition, it's easy to see that given $\theta\in\mathbb{R}:\nabla  f(\theta) = 0$, then
$$
f(\theta) \le f(y) - \frac{\lambda}{2}\lVert \theta      -y\rVert^2 \le f(y)
$$
for all $y\in\mathbb{R}$, which makes it a global maximum.

Also, if we had $\theta_1, \theta_2$  such that $\nabla f(\theta_i) = 0$ for $i\in\{1,2\}$, then $f(\theta_1) = f(\theta_2)$, but 
$$
f(\theta_2) = f(\theta_1) \le f(\theta_2) - \frac{\lambda}{2}\lVert  \theta_1  - \theta_2 \rVert^2 \iff \frac{\lambda}{2}\lVert \theta_1   - \theta_2 \rVert^2 = 0 \iff \theta_1 = \theta_2
$$
which means that such a $\theta$ is unique.

### Question 6

> Give an expression for $\nabla f_\lambda$

By using the definition of $f_\lambda(x) = f(x) + \frac{\lambda}{2}\lVert x\rVert^2$ and $f(x) = \sum^{m}_{i=1}y_ig(\left<x_i,x\right>)) +  (1-y_i)g(-\left<x_i,x\right>)$, and the simple facts:

1. $\nabla_x \lVert x \rVert^2 = 2x$
2. $\nabla_x\left<a,x\right>  = a$

We have that
$$
\begin{align}
g'(x) &= (\log(1+e^x))' = \frac{e^x}{1+e^x} =\\
&= 1 - \frac{1}{1+e^x} \\
g'(-x) &= \frac{\frac{1}{e^x}}{1+\frac{1}{e^x}} = \frac{1}{e^x + 1} =\\
&= 1-g'(x) \\
\\

\nabla f(x) &= \sum^m_{i=1}
y_i\tilde{x_i}\nabla g(\left<\tilde{x_i},x\right>) -
(1-y_i)\tilde{x_i}\nabla g(-\left<\tilde{x_i},x\right>) =\\
&= \sum^m_{i=1}
\tilde{x_i}\left(y_i\nabla g(\left<\tilde{x_i},x\right>) -
(1-y_i)\nabla g(-\left<\tilde{x_i},x\right>) \right) =\\
&= \sum^m_{i=1}
\tilde{x_i}\left(y_i\left( 1 - \nabla g(-\left<\tilde{x_i},x\right>)\right) -
(1-y_i)\nabla g(-\left<\tilde{x_i},x\right>) \right) =\\
&= \sum^m_{i=1}
\tilde{x_i}\left(y_i - y_i\nabla g(-\left<\tilde{x_i},x\right>) -
\nabla g(-\left<\tilde{x_i},x\right>) + y_i\nabla g(-\left<\tilde{x_i},x\right>) \right) =\\
&= \sum^m_{i=1}
\tilde{x_i}\left(y_i -
\nabla g(-\left<\tilde{x_i},x\right>)\right) \\
\\

\nabla f_\lambda(x) &= \nabla f(x) + \nabla (\frac{\lambda}{2}\lVert x\rVert^2) =\\
&= \nabla f(x) + \lambda x =\\
&= \sum^m_{i=1}
\tilde{x_i}\left(y_i -
\nabla g(-\left<\tilde{x_i},x\right>)\right) + \lambda x
\\
\end{align}
$$

### Question 7

> Implement a function `[f,g] = logistic_regression(train,  theta, lambda)` that takes as input the training data $\theta\in\mathcal{E}$ and returns the  output value $f_\lambda(\theta)$ and the gradient $\nabla f_\lambda(\theta)$ for some  fixed $\lambda$

```matlab
function [f,g] = logistic_regression(train, theta, lambda)
    X = train.X;
    y = train.y;

    cross_product = X' * theta;
    log__ = log(1 + exp(sign(y) .* cross_product));
    f = y .* log__ + (1.-y) .* log__;

    exp__ = exp(cross_product);
    g = lambda*theta  + X *(exp__ ./ (1 + exp__));    
end
```

### Question 8

> Check that your gradient code is correct by generating a random $\theta$ nd $v$ and ploting the error $\mid f_\lambda(\theta+tv)-f_\lambda(\theta) - t\left<v,\nabla f_\lambda(\theta)\right>\mid$ versus $t$ where `t = logspace(-8,0,101)`.

```matlab
function checkgradient(fhandle, theta, v)    
    n = 101;
    ts = logspace(-8, 0, n);

    f_theta_tv = fhandle(theta + v*ts);
    [f_theta, grad_f_theta] = fhandle(theta);

    errors = abs(f_theta_tv - f_theta - (v' *grad_f_theta)*ts);
    loglog(ts, errors)
end
```

### Question 9

> What is the value of $\frac{1}{4}\sigma_{\max}(X)^2$ for the training set?

`L = max(max(train.X))^2/4`, which for our dataset turns out to be $21.0828$

### Question 10

> Implement gradient descent with constant step-length $\frac{1}{L}$ to generate a sequence $\theta_0 , \theta_1 , \theta_2 , \dots$starting from a random initial point $\theta_0 \in E$ and with $\lambda = 10^{−4}$. The function should (at least) return the final iterate, and the gradient norm and total running time at each iterate. To measure time you can use the commands `tic`  and `toc`.

```matlab
function [theta, gradnorms, times] = cstgradientdescent(fhandle, x0, alpha, params)
    maxiters = params.maxiters;
    maxtime = params.maxtime;
    tolgradnorm = params.tolgradnorm;

    gradnorms = zeros(1, maxiters + 1);
    times = zeros(1, maxiters + 1);

    xk = x0;
    tic
    for iter = 1:maxiters
        [~, max_direction] = fhandle(xk);
        min_direction = -max_direction;
        xk = xk + alpha*min_direction;

        times(iter) = toc;
        if times(iter) > maxtime
            break
        end

        gradnorms(iter) = norm(min_direction);
        if gradnorms(iter) < tolgradnorm
            break
        end
        if gradnorms(iter) / gradnorms(1) < 5e-4
            break
        end
    end

    theta = xk;
    gradnorms = gradnorms(1:iter);
    times = times(1:iter);
end
```

### Question 11

> Run the algorithm for at most 3 minutes, and show a plot of the norm of the gradient $\lVert\nabla f_\lambda (\theta_k)\rVert$ as a function of $k$ (log-scale on the vertical axis). You may include a stopping criterion so that the algorithm stops whenever the ratio $\frac{\lVert\nabla  f_\lambda (\theta_k )\rVert}{\lVert\nabla f_\lambda(\theta_0)\rVert}$ drops below a threshold $\varepsilon$, for example $\varepsilon = 5 · 10^{−4}$

![](/home/ayhon/uni/NO Nonlinear Optimization/gradient_norm_to_iterations.png)

### Question 12

> Using properties of $f_\lambda$ established here, and referring to appropriate results in the lecture notes, argue that the algorithm converges to the global minimizer of $f_\lambda$. Be precise. Comment briefly in light of the plot you produced in the previous question.

Since $f_\lambda$ is strongly convex, it's in particular convex, and convex functions must have at most one global minimizer. Since it's also strongly convex, we know that there must exist one global minimizer, and that this minimizer is the $\theta\in\mathcal{E}$ where $\nabla f_\lambda(\theta) =0$. As we see in the previous graph, our function's norm  approaches zero as the iterations go by, which tells us we've hit the minimizer.

### Question 13

> Implement a backtracking line-search method (Algorithm 3.1 in Nocedal and Wright) and run the same experiment as in question. You will have to play around with parameters ᾱ, ρ, c. Typical values are ρ ∈ [0.5, 0.8] and c = 10−4 . For ᾱ, you can set a fixed value (tuned through experimentation), or you can take inspiration from §3.5 in Nocedal and Wright for fancier techniques where ᾱ changes with k. Show the new plot of $\lVert\nabla  f_\lambda (\theta_k )\rVert$ versus $k$.

```matlab
function alpha = linesearch(fhandle, x, v, lsparams)
    alphabar = lsparams.alphabar;
    c = lsparams.c;
    rho = lsparams.rho;
    alphamin = lsparams.alphamin;

    alpha = alphabar;

    [f_x, g_f_k] = fhandle(x);

    while alpha >= alphamin
        if fhandle(x + alpha*v) <= f_x + c*alpha*(g_f_k'*v)
            break
        end
        alpha = rho * alpha;
    end

    if(rho * alpha < alphamin)
        warning('Backtracking minimum step size reached!');
    end
end
```

### Question 14

> It is deceiving to compare the plots from questions 11 and 13, because it hides the extra work that the line-search method had to do. On a single plot, show the behavior of both algorithms, but this time with $\lVert\nabla  f_\lambda (\theta_k )\rVert$ (still on a log-scale) versus computation time.

### Question 15

> The θ you found through optimization is a pair θ = (x, b) ∈ Rn×n × R. In particular, x is an image of the same size as the images in our data set. Show this image in a grayscale figure  (with a colorbar for scale) and report the value of b.

 ![](/home/ayhon/uni/NO Nonlinear Optimization/new_image.png)

where $b = -6.6611e+03$

### Question 16

> For each image–label pair in the test set, $(x_i, y_i)$, compute $z_i = \sigma(h_\theta, \tilde{x}_i i)$ (again with $\tilde{x}_i = (x_i , 1)$). If $z_i > \frac{1}{2}$, you predict that $y_i = 1$, otherwise you predict $y_i = 0$. Compare with the true label $y_i$ . Count the number of mistakes you make and report this number (Matlab starter code: `binary_classifier_accuracy`). Display the images that your $\theta$ got wrong (Matlab starter code: `showMNISTImages_many`) and report the value of $z_i$ for each mistake ($z_i$ is an indication of how confident your algorithm is.) Do the same with the train data. Comment briefly with respect to our overarching goal.

![image-20220315151420902](/home/ayhon/.var/app/io.typora.Typora/config/Typora/typora-user-images/image-20220315151420902.png)

![image-20220315151447618](/home/ayhon/.var/app/io.typora.Typora/config/Typora/typora-user-images/image-20220315151447618.png)
