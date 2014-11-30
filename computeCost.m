function [J, grad] = computeCost(X, y, theta, lambda)

m = length(y);

% initialise
J = 0;
grad = zeros(size(theta));

J = 1 / (2 * m) * (X * theta - y)' * (X * theta - y);

J = J + lambda/(2 * m) * theta(2 : end)' * theta(2 : end);

grad = 1/m * X' *(X * theta - y);

grad(2 : end) = grad(2 : end) + lambda/m * theta(2 : end);

grad = grad(:);

end
