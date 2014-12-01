function [theta] = trainLinearRegression(X, y, lambda)
% X = features
% y = outcomes (ie from supervied learning)
% lambda = buffer to stop overfitting
% theta = learned parameters

%% find theta
%
% HWD 01/12/14
%
% this uses computeCost
%
% Note you probably shouldn't use this for very large data sets as it
% involves inversing a matrix - instead you should use gradient decent

% Initialize Theta
initial_theta = zeros(size(X, 2), 1);

% Create "short hand" for the cost function to be minimized
costFunction = @(t) computeCost(X, y, t, lambda);

% Now, costFunction is a function that takes in only one argument
options = optimset('MaxIter', 200, 'GradObj', 'on');

% Minimize using fmincg
theta = fmincg(costFunction, initial_theta, options);

end
