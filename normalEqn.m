function [theta] = normalEqn(X, y)

% Note you probably shouldn't use this for very large data sets as it
% involves inversing a matrix

theta = zeros(size(X, 2), 1);

theta = pinv(X' * X) * X' * y;

end
