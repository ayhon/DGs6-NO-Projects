## General definitions

1. $\sigma = 0.1$

2. $h:\R^2\to \R :x\mapsto h(x) = \exp\left(\frac{-\lVert x \rVert^2}{\sigma^2}\right)$

3. $\varphi: \R^2 \to \R^{n^2}: x\mapsto \varphi(x) = \begin{bmatrix}h(p_1-x)\\\vdots\\h(p_{n^2}-x)\end{bmatrix}$

4. $\Phi: \R^{2\times K}\to\R^{n^2}:X\mapsto\Phi(X) = \sum^K_{k=1} \varphi(x_k)$

5. $f: \R^{2\times K}\to\R:X\mapsto f(X) = \frac{1}{2}\left\lVert\Phi(X) - y\right\rVert^2$

6. $K$ is the number of stars

7. $n^2$ is the number of pixels we sample (Distributed in a $n\times n$ grid)

## Exercise 3

> Obtain an expression for $D\varphi(x)[u]$

If we define $h_i(x) = h(p_i - x)$ for $i\in\{1,\dots,n^2\}$, then we have

$$
\begin{align*}
D\varphi(x)[u] &= \lim_{t\to 0}\frac{\varphi(x+tu) - \varphi(x)}{t} \\
 &= \lim_{t\to 0}\frac{1}{t}\begin{bmatrix}
    h(p_1 - x - tu) - h(p_1 - x) \\
    \vdots \\
    h(p_{n^2} - x - tu) - h(p_{n^2} - x)
\end{bmatrix} = \\
 &= \begin{bmatrix}
    \lim_{t\to 0}\frac{h(p_1 - x - tu) - h(p_1 - x)}{t} \\
    \vdots \\
    \lim_{t\to 0}\frac{h(p_{n^2} - x - tu) - h(p_{n^2} - x)}{t}
\end{bmatrix} = \\
 &= \begin{bmatrix}
     Dh(p_1-x)[-u]\\
    \vdots \\
    Dh(p_{n^2}-x)[-u]
\end{bmatrix} = \\
 &= \begin{bmatrix}
    -Dh(p_1-x)[u]\\
    \vdots \\
    -Dh(p_{n^2}-x)[u]
\end{bmatrix}
 = \begin{bmatrix}
     Dh_1(x)[u]\\
    \vdots \\
    Dh_{n^2}(x)[u]
\end{bmatrix}
\end{align*}
$$

It's easy to see that $\nabla h(x) = \frac{-2x}{\sigma^2}\exp\left(-\frac{\lVert x \rVert ^2}{\sigma^2}\right) $ , and substituting $D_{h_i}(x)[u]$ for $\left<\nabla h_i(x),u \right>$, in our previous expression for $D\varphi(x)[u]$, we observe that thanks to $h_i$ having a gradient, we can express it as

$$
D\varphi(x)[u] = \begin{bmatrix}
    Dh_1(x)[u]\\
    \vdots \\
   Dh_{n^2}(x)[u]
\end{bmatrix} = \begin{bmatrix}
    \left<\nabla h_1(x),u\right>\\
    \vdots \\
    \left<\nabla h_{n^2}(x),u\right>
\end{bmatrix} = A(x)u
$$

where

$$
A: \R^2\to \R^{n^2 \times 2}: x \mapsto \begin{bmatrix}
 \cdots \nabla h_1(x)\cdots \\
 \vdots\quad\quad\vdots\quad\quad\vdots \\
 \cdots \nabla h_{n^2}(x) \cdots 
\end{bmatrix} = \begin{bmatrix}
 \cdots -\nabla h(p_1-x)\cdots \\
 \vdots\quad\quad\vdots\quad\quad\vdots \\
 \cdots -\nabla h(p_{n^2}-x) \cdots 
\end{bmatrix}

$$

## Exercise 4

Since the adjoint of a matrix $A(x)$ is its transpose, we have that

$$
A(x)^*: = \begin{bmatrix}
 \vdots &\cdots &\vdots \\
 \nabla h_1(x) &\cdots & \nabla h_{n^2}(x) \\
 \vdots &\cdots &\vdots 
\end{bmatrix} = A(x)^T
$$

## Exercise 5

Recall how we defined the function $f$ as a function of other functions

* $f(X) = \frac{1}{2}\left\lVert\Phi(X) - y\right\rVert^2$ 
- $\Phi(X) = \sum^K_{k=1} \varphi(x_k)$

* $\varphi(x) = \begin{bmatrix}h(p_1-x)\\\vdots\\h(p_{n^2}-x)\end{bmatrix} = \left[h(p_i - x)\right]^{n^2}_{i=1}$

And finally, the definition of the dot product $\left<A,B\right>$ for any matrices $A \in\R^{n\times m}$ and $B\in \R^{n \times k}$ ($n,m,k>0$)

$$
\left<A,B\right> = tr(A^TB)
$$

First, we recall that $D_\varphi(x)[u] = A(x)\;u$, where $A(x)\in\R^{n^2\times 2}$.

With this information, we get the following expression for 

$$
\begin{align*}
D\Phi(X)[U] &= \sum^K_{k=1}D\varphi(x_k)[u_k] =\\
 &= \sum^K_{k=1}A(x_k)u_k
\end{align*}
$$

And thanks to this, we can find a final expression for $D_f(X)(U)$

$$
\begin{align*}
Df(X)[U] &= \left<\Phi(X) - y, D\Phi(X)[u_k]\right> = \\
 &= \left<\Phi(X) - y, \sum^K_{k=1}A(x_k)u_k \right> = \\
 &= \sum^K_{k=1}\left<\Phi(X) - y, A(x_k)u_k \right> = \\
 &= \sum^K_{k=1}\left<A(x_k)^*(\Phi(X) - y), u_k \right> = \\
 &= tr\left(\left(\left[A(x_k)^*(\Phi(X) - y)\right]_{k=1}^{K}\right)^TU\right) = \\
 &= \left<\left[A(x_k)^*(\Phi(X) - y)\right]_{k=1}^{K}, U\right>
\end{align*}
$$



And so, thanks to the definition of gradient, we can identify the gradient of $f$ as

$$
\nabla f(X) = \left[A(x_k)^*(\Phi(X) - y)\right]_{k=1}^{K} = \begin{bmatrix}
  A(x_1)^*(\Phi(X) - y) \\
  \vdots \\
  A(x_K)^*(\Phi(X) - y)
\end{bmatrix}
$$
