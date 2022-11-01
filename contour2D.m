function contour2D(f, x1range, x2range, ncontours)
% Inputs:
%   A function handle f which takes as input a column vector with two
%       entries and gives as output a real number.
%   x1range: a vector with two entries specifying the range to plot for the
%       first variable; default is [-5, 5].
%   x2range: same as x1range but for the second variable.
%   ncountours: integer specifying how many countour lines to draw
%       (default is 10).
%
% Result: plots the countours (level sets) of f in the plane.
%
% Example:
%
%   f = @(x) x'*diag([5, 1])*x;              % f : R^2 -> R
%   contour2D(f);                            % use all default values
%   contour2D(f, [-10, 10], [-10, 10], 25);  % specify all parameters
%
% MATH-329 @ EPFL, Feb. 23, 2022.

    if ~exist('x1range', 'var') || isempty(x1range)
        x1range = [-5, 5];
    end
    if ~exist('x2range', 'var') || isempty(x2range)
        x2range = [-5, 5];
    end
    if ~exist('ncontours', 'var') || isempty(ncontours)
        ncontours = 10;
    end

    xx1 = linspace(min(x1range), max(x1range), 151);
    xx2 = linspace(min(x2range), max(x2range), 151);
    [X1, X2] = meshgrid(xx1, xx2);
    F = zeros(size(X1));
    for k1 = 1:size(F, 1)
        for k2 = 1:size(F, 2)
            x1 = X1(k1, k2);
            x2 = X2(k1, k2);
            F(k1, k2) = f([x1;x2]);
        end
    end

    contourf(X1, X2, F, ncontours);
    axis equal;
    colorbar;
    xlabel('x_1');
    ylabel('x_2');

end