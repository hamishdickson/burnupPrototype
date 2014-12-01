function [J, grad] = computeCost(X, y, theta, lambda)
% X = features
% y = outcomes (ie from supervied learning)
% theta = learned parameters
% lambda = scalar, buffer to stop overfitting
% J = cost function
% grad = gradient of the cost function (ie it's derivative)

%% Compute cost and grad functions
%
% HWD 01/12/14
%
% Compute the cost function and grad function for a given theta
%

m = length(y);

% initialise
J = 0;
grad = zeros(size(theta));

% calculate J
J = 1 / (2 * m) * (X * theta - y)' * (X * theta - y);

J = J + lambda/(2 * m) * theta(2 : end)' * theta(2 : end);

% calculate grad
grad = 1/m * X' *(X * theta - y);

grad(2 : end) = grad(2 : end) + lambda/m * theta(2 : end);

grad = grad(:);

end
