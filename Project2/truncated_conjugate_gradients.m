function [u,Hu] = truncated_conjugate_gradients(H,b,radius, maxiter)
if ~exist('maxiter', 'var') || isempty(maxiter)
    maxiter = 10000;
end

    vk = 0;
    rk = b;
    pk = r0;
    for i=1:maxiter
        c1 = H*pk;
        c2 = pk'*c1;
        alpha = norm(rk)^2/c2;
        vk_ = vk + alpha * pk;
        if (c2 < 0 || norm(vk_) >= radius)
            u = vk + t*pk;
            Hu = b - rk + t*c1;
            break
        else
            vk = vk_;
        end

        rk_ = rk - alpha * c1;
        if (nomr(rk) <= norm(b)*min([norm(b),.1]))
            u = vk;
            Hu = b - rk_;
        end
        beta = norm(rk_)^2/norm(rk)^2;
        pk = rk_ + beta*pk;
        rk = rk_;
    end


end

