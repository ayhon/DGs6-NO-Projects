# Part 1: Projections to cones and stopping criteria in constrained optimization

##### Show that if $Q$ is non-empty and closed then $\text{Proj}_Q(z)$ is non-empty

Let $f_z(x) = \frac{1}{2}\lVert x - z\rVert^2$, then 

$$
\text{Proj}_Q(z) = \{x\in Q : f_z(x) = \min_{y\in Q} f_z(y)\}
$$

We can see that the closer a given $x$ is to $z$, the lower $f_z(x)$ is, with $\forall x$ $f_z(x) \ge 0$.

Since $Q$ is non-empty, let $x\in Q$ and consider 

$$
Q(x) := \{y\in Q : f_z(y) \le f_z(x)\}
$$

Observer that $x\in Q(x)$, so $Q(x) \ne \empty$. Moreso, $Q(x)\in[, f_z(x)]$ which is a closed and bounded interval in $\R$ (And therefore compact by Heinz-Borel).

Since $Q(x)$ is compact, it must have a minimum $f_{min}$ and so $\exists y\in Q$ such that $f_z(y) = f_{min}$ which means that $y\in \text{Proj}_{Q}(z)$, which proves that $\text{Proj}_Q(z)$ isn't empty. 

##### Give an example of $Q \subseteq \mathcal{E}$ non-empty and closed where $z\in\mathcal{E}$ such that $\text{Proj}_Q(z)$ is not a singleton

$Q = \{\vec{x}\in \R^2 : \lVert \vec{x} \rVert = 1\}$, $z = (0,0) \in \R^2$, then $\text{Proj}_Q(z) = Q \ne \{x\}$ for some $x\in Q$.

##### Let $C$ be a non-empty closed cone. Show that $\text{Proj}_Q(z) = \{0\} \iff z\in C^\circ$.

Proving $\Rightarrow$

$$
\begin{align*}
 \text{Proj}_C(z) = \{0\} &\Rightarrow \forall x \in C \frac{1}{2}\lVert z \rVert^2 \le \frac{1}{2}\lVert x-z\rVert^2 \iff \\
 & \iff \lVert z \rVert^2 \le \lVert x \rVert ^2 + \lVert z \rVert^2 - 2\left<x,z\right> \iff \\
 & \iff \left<x,z\right> \le \frac{1}{2}\lVert x \rVert^2
\end{align*}
$$

Since $C$ is a cone, $\forall \alpha > 0\ \forall x \in C$ we have $\alpha x \in C$ and therefore

$$
\left<\alpha x, z\right> = \alpha \left<x,z\right> \le\frac{1}{2}\lVert \alpha x \rVert^2 = \frac{\alpha^2}{2}\lVert x \rVert^2 \iff \\
\iff \left<x, z\right> \le \frac{\alpha}{2}\lVert x \rVert^2
$$

Making $\alpha$ go towards $0$, we conclude that $\left<x,z\right> \le 0$ which means that by definition, $x\in C^\circ$.

Proving $\Leftarrow$

Notice how $0\in C$ since $C$ is closed and nonempty.

We have that $\forall x \in C$

$$
\begin{align*}
& \left<x,z\right> \le  0\iff \\
\iff &2\left<x,z\right> \le 0 \le \lVert x\rVert^2 \iff \\
\iff &\lVert z \rVert^2 + 2\left<x,z\right> \le \lVert x \rVert ^2 + \lVert z \rVert ^2 \iff \\
\iff &\frac{1}{2}\lVert z \rVert^2 \le \frac{1}{2}\lVert x - z \rVert^2
\end{align*}
$$

Let $f_z(x) =\frac{1}{2}\lVert x- z\rVert^2$, then $\text{Proj}_C(z) = \{x\in Q: f_z(x) = \min_{y\in Q} f_z(y)\}$ and we've seen that $f_z(0) = \frac{1}{2} \lVert z \rVert^2 \le \frac{1}{2}\lVert x - z\rVert ^2 = f_z(x)$ for all $x\in C$, so $0 \in \text{Proj}_C(z)$.

To see that $\text{Proj}_C(z) = \{0\}$, assume there is $0\ne y\in\text{Proj}_C(z)$, so

$$
\begin{align*}
\frac{1}{2}\lVert y - z\rVert^2 &= f_z(y) = f_z(0) = \frac{1}{2} \iff \\
& \iff \frac{1}{2} \lVert y \rVert^2 - \left<z, y\right> + \frac{1}{2}\lVert z \rVert^2 = \frac{1}{2}\lVert z \rVert^2 \iff \\
& \iff \frac{1}{2}\lVert y \rVert^2 = \left<z,y\right>
\end{align*}
$$

but since $\lVert y \rVert^2 \ge 0$ and $\forall x \in C \left<z,x\right> \le 0$, this means that $y\notin C$, which means that it cannot be in $\text{Proj}_C(z)$

##### Given $S\subseteq \mathcal{E}$ and $f:\mathcal{E}\to\R$ differentiable, show that $x^*\in S$ is stationary for $\min_{x\in S}f(x)$ if and only if $\text{Proj}_{T_x S}\left(-\nabla f(x^*)\right) = \{0\}$.

$x^*$ is stationary for $\min_{x\in S} f(x)$ $\iff$ $Df(x^*)[T_{x^*}S] \ge 0 \iff -\nabla f(x^*)\in(T_{x^*}S)^\circ \iff \text{Proj}_{T_{x^*}S}(-\nabla f(x^*)) = \{0\}$.

##### Let $C$ be a closed cone in $\mathcal{E}$, show that if $v\in\text{Proj}_C(z)$ the $\left<v,z-v\right> = 0$.

![](/home/ayhon/.var/app/com.github.marktext.marktext/config/marktext/images/2022-05-09-13-27-40-sandwitch_cone_dot_product.png)

The idea is to prove that for $\alpha > 1$ we have

- $\left<\alpha v, z - \alpha v\right>  \ge 0$

- $\left<\frac{1}{\alpha} v, z - \frac{1}{\alpha}v\right> \le 0$

Then, making $\alpha$ go towards $1$ we see that $\left<v, z-v\right> = 0$.

We observe that

- $\left<z - \frac{1}{\alpha} v, \frac{1}{\alpha}v\right> \ge 0 \iff \frac{1}{\alpha}\left<z,v\right> - \frac{1}{\alpha^2}\lVert v \rVert ^2 \ge 0 \iff \left<z,v\right> \ge \frac{1}{\alpha}\lVert v \rVert^2$

- $\left<z - \alpha  v, \alpha v\right> \le 0 \iff \alpha \left<z,v\right> - \frac{1}{\alpha^2}\lVert v \rVert ^2 \le 0 \iff \left<z,v\right> \le \alpha \lVert v \rVert^2$

And likewise, $\left<z-v,v\right> = 0 \iff \left<z,v\right> = \lVert v \rVert ^2$.

Since $v\in\text{Proj}_C(z)$ then $v$ is a solution to $\min_{x\in Q}f_z(x)$ so $\forall x \in C$ $\frac{1}{2}\lVert v - z \rVert^2 \le \frac{1}{2}\lVert x - z \rVert ^2$.

In general, for $\beta > 0$

$$
\frac{1}{2}\lVert v - z \rVert ^2 = \frac{1}{2}(\lVert v \rVert^2 + \lVert z \rVert ^2) - \left<z,v\right> \le \frac{1}{2} (\beta ^2\lVert v \rVert^2 + \lVert z \rVert ^2) - \beta \left<z,v\right>
$$

and therefore 

$$
\frac{1}{2}((1-\beta^2)\lVert v \rVert ^2) \le (1-\beta)\left<z,v\right> \tag{1.5.1}
$$

.

For $\beta >1$, we have that $0 > 1-\beta^2 > 1 - \beta$ so using $(1.5.1)$ we get that

$$
\frac{(1-\beta^2)}{2(1-\beta)} \lVert v \rVert ^2 \le \left<z,v\right>
$$

where $\frac{(1-\beta^2)}{2(1-\beta)} = \frac{1 + \beta}{2} > 1$.  

For $\beta \in[0,1)$, we have that $1-\beta^2  < 1-\beta < 0$  so using $(1.5.1)$ we get that

$$
\frac{(1-\beta^2)}{2(1-\beta)} \lVert v \rVert ^2 \ge \left<z,v\right>
$$

where $\frac{(1-\beta^2)}{2(1-\beta)} = \frac{1 + \beta}{2} < 1$.

Making $\beta$ go towards $1$ we get the desired result.

##### Show that all projections of $z\in\mathcal{E}$ to $C$ have  the same norm

Let $v_1,v_2\in\text{Proj}_C(z)$. As previously seen $\left<v_1,z\right> = \lVert z \rVert^2 = \left<v_2,z\right>$, and by definition of belonging in $\text{Proj}_C(z)$

$$
\begin{align*}
\frac{1}{2}\lVert v_1 - z\rVert^2 = \frac{1}{2}\lVert v_2 - z\rVert^2 \iff \frac{1}{2}(\lVert v_1\rVert^2 + \lVert z \rVert^2) - \left<v_1,z\right> = \frac{1}{2}(\lVert v_2\rVert^2 + \lVert z \rVert ^2) - \left<v_2,z\right>\iff\lVert v_1 \rVert^2 = \lVert v_2\rVert^2
\end{align*}
$$

##### Give an example of a set $S$ and a function $f$ for which the function $q(x) := \lVert \text{Proj}_{T_xS}(-\nabla f(x))\lVert$ is discontinuous on $S$

Let $S := [0,1]^2 \cup [1,2]\times\{0\}$ and $f(x) = x_1 - x_2$, with $-\nabla f(x) = \begin{bmatrix}-1&1\end{bmatrix}^T$.

![](/home/ayhon/.var/app/com.github.marktext.marktext/config/marktext/images/2022-05-09-14-24-09-q_discontinuous.png)

Let $x(t) = (2-t,0)$, then:

- For $t\in[0,1)$, $T_{x(t)}S = \{\vec{x}\in\R^2 : x_2 \ge 0\}$ and so,
  $g(x(t)) = \lVert \text{Proj}_{T_{x(t)}S}(-\nabla f(x(t)))\rVert = 1$.

- For $t\in [1,2)$, $T_{x(t)}S=\{\vec{x}\in\R^2:x_1 < 0 \text{ or } x_2 > 0\}$ and so,
  $g(x(t)) = \lVert\text{Proj}_{T_{x(t)}S}(-\nabla f(x(t)))\rVert = \sqrt{2}$

Therefore there is a discontinuity in $x(1)$.

##### Show that for the set $S=\{x\in\R^2: x_1^2 + x_2^2 = 1\}$ the function $q$ is continuous whenever $f$ is continuously differentiable.

We see that, given $x$ such that $\lVert x \rVert ^2 = 1$, $T_xS = \{\alpha(-x_2,x_1) : \alpha \in R\}$, therefore, $\text{Proj}_{T_xS}(v)$ is $\{(-x_2,x_1)\cdot\left<(-x_2,x_1),v\right>\}$ which means that $g(x) = \lvert \left< (-x_2,x_1),v \right> \rvert$ since $\lVert (-x_2,x_1)\rVert = \lVert x \rVert  = 1$.

Since both $\nabla f$, $\left< (-x_2, x_1), \;\cdot\;\right>$ and $\lvert \;\cdot\;\rvert$ are continuous, $g$ is a composition of continuous functions, which is continuous

##### Assuming $h:\R^n\to\R$ is continuously differentiable and that LICQ holds for all $x$ in $S=\{x\in\R^2:h(x) = 0\}$, give an expression for $T_xS$

If LICQ holds for $x$ then 

$$
\begin{align*}
T_xS &= F_xS \\
 &= \{y\in\R^n : \forall i \in\{1,\dots,p\}\ \left<\nabla h_i(x),y\right> = 0\} = \\
 &= \{y\in\R^n : \nabla h(x) y = \vec{0}\}
\end{align*}
$$

where 

$$
\nabla h(x) = \begin{bmatrix}
\nabla h_1(x)^T \\
\vdots \\
\nabla h_p(x)^T
\end{bmatrix} \in \text{Mat}_{p\times n}(\R)
$$

Therefore $T_xS = \ker(\nabla h(x))$.

##### Argue that the projection of $z\in\mathcal{E}$ to $T_xS$ is unique and give an expression for $\text{Proj}_{T_xS}(z)$.

We remember that $\text{Proj}_{T_xS}(z) = \{\argmin_{y\in T_xS}\frac{1}{2}\lVert z - y \rVert^2\}$, therefore $x\in \text{Proj}_{T_xS}(z)$ is an optimal solution of the problem

$$
\begin{align*}
\min\ \;& \frac{1}{2}\lVert z - y\rVert ^2 \\
 \text{s.t.}\ \;& \nabla h(x) y = \vec{0}
\end{align*}
$$

Since $\nabla h(x) y = 0 \iff y\in \ker(\nabla h(x))$ and $\ker(\nabla h(x))$ is a vector space, we can consider any bijective mapping $A : \R^{n-p}\to\ker(\nabla h(x))$ (which we know is of dimension $n-p$ since $p \le n$ is necessary for LICQ to hold and the rank of $\nabla h(x)$ is maximal thanks to LICQ)

Thanks to $A$ we can rewrite the original problem as the equivalent problem

$$
\min_{x\in \R^{n-p}} \frac{1}{2}\lVert z - Ax \rVert ^2 \\

$$

for which we know the optimal solution can be retrieved with the Moore-Penrose pseudo-inverse.

Therefore $x^* = A^{\dag}z = (A^TA)^{-1}A^Tz$ and $y^* = Ax^*$. 

Observe how the choice of $A$ doesn't really matter to us, since although for two different mappings $A_1, A_2$ we may get different optimal solutions $x_1, x_2$, we're interested in $y^* = A_1x_1 = A_2 x_2$

TODO: Uniqueness of the solution

##### Explain briefly why $q$ is continuous on $S$ whenever $f$ is continuously differentiable.

$q(x) = \lVert \text{Proj}_{T_xS}(-\nabla f(x))\rVert = \lVert A A^{\dag} z \rVert$ where

- $\lVert \; \cdot \; \rVert$ is continuous

- $A$ is continuous since it's a vector mapping

- $A^\dag$ is continuous since $A \mapsto A^{-1}$ is continuous and $A^\dag = (A^TA)^{-1}A^T$.

Therefore $q$ is but multiple compositions of continuous functions, which ends up being continuous

---

# Part 2: A Frank-Wolfe algorithm

```lua
function FrankWolfe(S, f, x_0, mu)
    for k = 1, ... do
        s[x_k] = argmin_linear(S, ∇f(x_k))
        x_{k+1} = (1-mu_k) * x_k + mu_k * s[x_k]
    end
end
```

##### Argue that the minimization problem $\min_{x\in S}\left<w,x\right>$ always has a solution

By Weierstrass, we know that $f(x) = \left<w,x\right>$ must contain its maximum in $S$.

##### Give an example showing that $\min_{x\in S}\left<w,x\right>$ may have more than one solution

![](/home/ayhon/.var/app/com.github.marktext.marktext/config/marktext/images/2022-05-09-17-18-40-min_not_unique.png)

Since $f(x) = \left<w,x\right>$ isn't injective, it could happen that many points in $S$ achieve the same value, which could happen to be optimal. The example I've chosen is with $S := [-1,1]\times[-2,0]$ and $w = \begin{bmatrix}1 & 0 \end{bmatrix}^T$, where the solutions are $\{x\in S: x_1 = 0 \}$.

##### Why is it important to enforce the condition $0 \le \mu_k \le 1$.

Since that way we ensure that $x_{k+1} = (1-\mu_k)x_k + \mu_k s(x_k)$ remains in $S$.

##### Argue why the following inequalities hold for any $k$

$$
\begin{align*}
f(x_{k+1}) - f(x_k) &\le \nabla f(x_k)^T(x_{k+1} - x_k) + \frac{L}{2}\lVert x_{k-+1} - x_k\rVert^2 \le\tag{B1} \\
 &\le  \mu_k\nabla f(x_k)^T(s(x_k) - x_k) + \frac{L}{2}\mu_k^2d_S^2   \le\tag{B2} \\
 &\le  \mu_k\nabla f(x_k)^T(x^* - x_k) + \frac{L}{2}\mu_k^2d_S^2      \le\tag{B3}\\
 &\le  \mu_k\left(f(x^*) - f(x_k)\right) + \frac{L}{2}\mu_k^2d_S^2    \le\tag{B4}
\end{align*}
$$

* $(\text{B}1)$
  
  By Taylor expansion and using that $f$ is $L$-Lipschitz.

* $(\text{B}2)$
  
  * $x_{k+1} = (1-\mu_k)x_k  + \mu_k s(x_k) = 1 + \mu_k (s(x_k) - x_k) \le \mu_k (s(x_k) - x_k)$.
  
  * $x_{k+1} - x_k = -\mu_k(x_k) + \mu_k s(x_k) = \mu_k(s(x_k) - w_k)$ so $\lVert x_{k+1} - x_k \rVert^2 = \mu_k^2\lVert s(x_k) - x_k\rVert^2 \le\mu_k 2d_S^2$ by definition of $d_S := \max\{\lVert x - y\rVert : x,y\in S\}$. 

* $(\text{B}3)$
  
  $$
  \nabla f(x_k)^T(s(x_k) - x_k) = \left<\nabla f(x_k)^T,s(x_k)\right> -\left<\nabla f(x_k)^T,x_k\right> = \min_{w\in S}\left<\nabla f(x_k)^T,w\right> - \left<\nabla f(x_k)^T,x_k\right> \le \left<\nabla f(x_k)^T,x^* \right> - \left>\nabla f(x_k)^T,x_k\right>
  $$

* $(\text{B}4)$
  Thanks to $f$ being convex, any Taylor linear approximation is a lower bound so $f(x^*) \ge f(x_k) + \nabla f(x_k)^T(x* - x_k)$ from which the inequality follows

##### Given $x_0\in S$, let $x_1$ be produced by the Frank-Wolfe algorithm with $\mu_0 = \frac{2}{0 + 2} = 1$. Show that  $f(x_1) - f(x^*) \le \frac{L}{2}d_S^2$.

$$
f(x_1) - f(x_0) \le \mu_0(f(x^*) - f(x_0)) + \frac{L}{2}\mu_0^2d_S^2 \iff f(x_1) - f(x^*) \le \frac{L}{2}d_S^2
$$

##### Show that $f(x_k) - f(x^*) \le \frac{2Ld_S^2}{k+2}$ with $\mu_k = \frac{2}{k+2}$ knowing that $\frac{2k+2}{(k+2)^2} \le \frac{2}{k+3}$.

If we assume the result is proven for $k, k-1, \dots, 0$, then

$$
\begin{align*}
f(x_{k+1}) - f(x^*) &= f(x_{k+1}) - f(x_k) + f(x_k) - f(x^*) \le \\
 &\le \frac{2}{k+2}(f(x^*) - f(x_k)) + \frac{L}{2}\frac{4}{(k+2)^2}d_S^2 + f(x_k) - f(x^*) = \\
 &= (f(x_k) - f(x^*))(1 - \frac{2}{k+2}) + \frac{2Ld_S^2}{(k+2)^2} \le \\
 &\le \frac{2Ld_S^2}{k+2}\left(\frac{k}{k+2}\right) + \frac{2Ld_S^2}{(k+2)^2} \le \\
 &\le Ld_S^2\frac{2k + 2}{(k+2)^2} \le\\
 &\le Ld_S^2\frac{2}{k+3} = \frac{2Ld_S^2}{(k+1) + 2} & \Box
\end{align*}

$$

##### Show that $\Delta^n$ is convex, compact and non-empty

###### Non-empty

Since $e_i = \begin{bmatrix}0\dots\;1\;\dots 0\end{bmatrix}^T$ (where the $i$-th position) is always in $\Delta^n$ for $i\in \{1,\dots,n\}$, the symplex cannot be empty.

###### Convex

If $\vec{x},\vec{y}\in\Delta^n$ then $\forall t \in (0,1)$

$$
\sum_{i=1}^n (1-t)x_i + ty_i = (1-t)\sum_{i=1}^n x_i + t\sum_{i=1}^n y_i = (1-t) + t 0 1
$$

###### Compact

By Heinz-Borel it suffices to show that it's bounded and closed. 

- Bounded follows from the fact that $\sum_{i=1}^nx_i = 1 \implies \lVert\vec{x}\lVert^2 \le 1$.

- Closed since given a sequence $(\vec{x_k})_{k\in\N}$ such that $\lim_{k\to\infty}\vec{x_k} = x$, then $\sum_{i=1}^\infty x_{k,i} = 1 \underset{k\to\infty}{\longrightarrow}1 = \sum_{i=1}^\infty x_i$ which means that $x\in\Delta^n$

##### Given a vector $w\in\R^n$, what is the smallest value that $\left<w,v\right>$ can take if $x\in\Delta^n$? How do you pick $x$ to attain this smallest value?

If $k = \argmin_{i\in\{1,\dots,n\}}w_i$, then $e_k$ achieves the minimum value.

For any other $\vec{x}\in\Delta^n$,

$$
\left<w,x\right> = \sum_{i=1}^nw_ix_i \ge \sum_{i=1}^nw_kx_i = w_k\sum_{i=1}^nx_i = w_k = \left<w, e_k\right>
$$

##### Based on the preivous question, propose a procedure to solve $\min_{x\in \Delta^n}\left<x,w\right>$, and give its computational complexity as a function of $n$.

```matlab
function x = simplex_min_linear(n,w)
    x = zeros(n)
    k = argmin(w)
    x(k) = 1
end
```

It's computation complexity is $O(n)$, since we need linear time to compute the minimum of $w$

##### Does the problem $\min_{x\in\Delta^n}\frac{1}{2}\lVert Ax - b\rVert^2$ always have a solution? Is it always unique?

Yes, since it's a convex program, it always has at least one solution. It also always has a unique solution, since $\frac{1}{2}\lVert Ax- b\rVert^2$ is strongly convex.

##### Given an expression for the gradient of $f$

$$
\nabla f(x) = Ax - b
$$

##### Considering the line search function $g(\eta) = f\left((1-\eta)x + \eta y\right)$ where $x,y\in\Delta^n$, what is the optimal value of $\eta\in[0,1]$?

Since $g$ is a strongly convex function, we know it achieves its minimum where $\lVert \nabla g(\eta) \rVert ^2 = 0 = \nabla g(\eta)$.

$$
\begin{align*}
\nabla g(\eta) &= (y-x)^T\nabla f((1-\mu)x + ty) =\\
 &= (y-x)^T(A(x + \mu(y-x)) - b) =\\
 &= \left<y-x, Ax-b\right>  + \mu\left<y-x, y-x \right> =\\
 &= \left<y-x, Ax-b\right> + \lVert y-x\rVert ^2
\end{align*}
$$

Therefore, $\nabla g(\eta) = 0 \iff \eta = \frac{-\left<y-x, Ax- b\right> }{\lVert y -x\rVert 2} $.

##### Write the Frank-Wolfe algorithm explicitly for the previous problem, $\min_{x\in\Delta^n}\frac{1}{2}\lVert Ax - b\rVert^2$.

```lua
function simplex_argmin_linear(n, w)
    k = 1
    min_value = inf
    for i in {1,...,n} do
        if w_i < min_value then
            min_value = w_i
            k = i
        end
    end
    return e_k
end

function get_optimal_mu_value(A,b,x,y)
    return -<y-x, A*x-b> / norm(y-x)^2
end

function FrankWolfe(S, A,b, x_0)
    for k = 1, ... do
        s[x_k] = simplex_argmin_linear(#S, A*x_k - b)
        mu_k = get_optimal_mu_value(A,b,x_k,s[x_k])
        x_{k+1} = (1-mu_k) * x_k + mu_k * s[x_k]
    end
end
```

##### Implement the algorithm in Matlab using the _Frank-Wolfe gap_, $g_k = \left<\nabla f(x_k), x_k - s(x_k)\right>$, as a stopping criterion (besides maximum numbemar of iterations)

```matlab
function gap = frank_wolfe_for_simplex(n, A, b, x_0, maxiter, tolerance)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  if ~exists('g', 'maxiter') || isempty(maxiter) do
    maxiter = 10000;
  end
  if ~exists('g', 'tolerance') || isempty(maxiter) do
    maxiter = 0.001;
  end
  
  optimal_mu = @(A,b,x,y) dot(y-x, A*x-b) / norm(y-x)^2;
  frank_wolfe_gap = @(A,b,xk,sk) dot(a*xk - b, xk - sk)
  x =  zeros(maxiter+1);
  mu = zeros(maxiter);
  s =  zeros(maxiter);
  gap = [];
  
  
  for k = 1:maxiter 
    s(k) = simplex_argmin_linear(n, A*x(k) - b);
    mu(k) = optimal_mu(A,b,x(k),s(k));
    x(k+1) = (1-mu(k)) * x(k) + m(k) * s(k);
    
    gap = [gap frank_wolfe_gap(A,b,x(k),s(k))]
    if(gap(k) < tolerance)
      break
    end
  end
end

function x = simplex_argmin_linear(n,w)
  x = zeros(n);
  k = argmin(w);
  x(k) = 1;
end
```

##### Run your algorithm in the data provided on Moodle and plot the Frank-Wolfe gap as a function of the number of iterations with a log-scale on the vertical axis

##### Compare how sparse is your solution with the one you get by solving $Ax=b$ with $A\setminus b$.

---

# Part 3: KKT conditions and constraint qualifications

##### Show that $\min_{x\in\R^n}f(x)$ and $\min_{(x,y)\in S}y$ with $f(x) := \max_{i\in\{1,\dots,N\}}f_i(x)$ and $S := {(x,y)\in\R^{n + 1} : f_i(y) - y \le 0}$.

To begin, $\min_{(x,y)\in S}y \le \min_{x\in R^n}f(x)$, since for any solution $x$ of the first problem, we have that $(x,f(x))$ is an equivalent solution for the first problem. 

Moreso, for any solution $(x,y)$ of the first problem, $(x,f(x))$ is always a better solution, since $\forall i\;f_i(y) \le y$, and in particular $f(x)$. This means that any solution which appears in the first problem has a better solution derived from it which belongs to the second problem.

In conclusion, both problems have the same minimums.

##### Write the KKT conditions for $\min_{(x,y)\in S} y$.

Let $F(x,y) = y$, then 

$$
\begin{align*}
\begin{bmatrix}0 \\ \vdots \\ 0 \\ 1 \end{bmatrix} =\nabla F(x,y) &= - \sum_{i=1}^{N+1}\lambda_i\nabla g_i(x) =\\
 &=  - \sum_{i=1}^{N+1}\lambda \begin{bmatrix}\nabla f_i(x)\\-1\end{bmatrix} =\\
 &=  \sum_{i=1}^{N+1}\lambda \begin{bmatrix}\nabla f_i(x)\\1\end{bmatrix} \iff\\
 &\iff \lambda_{N+1} = 1 \text{ and }\forall i \in\{1,\dots,N\}\ \sum_{i=1}^N\nabla f_j(x)_i \lambda_i = 0
\end{align*}
$$



##### Give an example of functions $f_1, \dots, f_N$ and a feasible point $(x,y)\in S$ for which LICQ does not hold

For $N=2$, with the functions 

$$
\begin{align*}
f_1(\vec{x}) &= \frac{x_2^2}{2} - x_1^2 \quad & f_2(\vec{x}) &= x_1^2 + x_2 \\
\nabla f_1(\vec{x}) &= \begin{bmatrix}
-2x_1 \\ x_2
\end{bmatrix} &
\nabla f_2(\vec{x}) &= \begin{bmatrix}
x_1 \\ 1
\end{bmatrix}
\end{align*}

$$

These functions are special since for $(x_1,x_2) = (0,1)$ we have that $\nabla f_1(0,1) = \nabla f_2(0,1)$, which is enough to show that $\{\nabla g_i(x) : i \in \mathcal{I}(x)\}$ are not linearly independent.

In particular,

$$
g_i(x) = f_i(x) - y \implies \nabla g_i(x) = \begin{bmatrix}
    \nabla f_i(x) \\
    -1
\end{bmatrix}
$$

Now, for LICQ to not hold we must make sure that both $g_1$ and $g_2$ are active constraints, which means that $f_1(0,1) = 0 = f_2(0,1)$. Therefore, we'll offset the original functions $f_1$ and $f_2$ by $\frac{1}{2}$ and $1$ respectively, which won't affect the derivative, but will ensure that $\{1,2\}\subseteq\mathcal{I}((0,1))$.



The final set of functions is therefore:

$$
\begin{align*}
f_1(x_1,x_2) &= \frac{x_2^2}{2} - x_1 - \frac{1}{2} \\
f_2(x_1,x_2) &= x_1^2 + x_2 - 1 \\
(x_1,x_2) &= (0,1) \\
\implies & \nabla g_1(x_1,x_2) = \nabla g_2(x_1,x_2)
\end{align*}
$$





##### Argue that MFCQ always holds for all feasible points in $S$.

##### What does the KKT theorem reveal about the Lagrange multipliers at an optimal solution $(x^*, y^*) \in S$.

```

```
