function [f, g] = logistic_regression(train, theta, lambda)
% Input:
%
%   train: The training data set (see Moodle)
%          This is a structure with fields train.X and train.y
%          containing, respectively, the examples (the images) and the
%          labels to be used for training.
% 
%   theta: A tentative parameter vector (column) for logistic regression
%
% Output:
%
%   f: value of the logistic regression negative log-likelihood cost function
%   g: gradient if the cost function at theta, as a column vector

    X = train.X;
    y = train.y;

    cross_product = X' * theta;
    signs = sign(y-1/2);
    assert(all((signs == -1) == (y == 0)),"You're not computing the signs correctly")
    signed_cross_product = signs .* cross_product;
    
    k = @(x) log(1 + exp(x));
    k_values = k(signed_cross_product);
    k_values(isinf(k_values)) = signed_cross_product(isinf(k_values));
    f = y .* k_values + (1-y) .* k_values + (lambda/2)*(dot(theta,theta));
    if any(isnan(f), 'all')
        warning(["NaNs in f"])
    end
    
    k_grad = @(x) 1 - (1./(1 + exp(x)));
    g = lambda*theta  + X * (y - k_grad(-cross_product));
    if any(isnan(g), 'all')
        warning(["NaNs in g"])
    end
    if any(isnan(f), 'all') || any(isnan(g), 'all')
        warning(['The function logistic_regression returned expressions containing NaNs.' ...
            'Read the section numerical considerations at the end of the homework and debug your code.']);
    end
    % Be mindful of that fact that your computation may also generate Inf
    % values (do you see why?). This should not be an issue overall, but
    % make sure that your code does the right thing when Inf values come
    % up. See also the comments about this at the end of the homework
    % sheet.
end
 