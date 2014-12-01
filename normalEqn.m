function [theta] = normalEqn(X, y)
% X = features
% y = outcomes (ie from supervied learning)
% theta = learned parameters

%% Solve for theta using linear algebra
%
% HWD 01/12/14
%
% Note you probably shouldn't use this for very large data sets as it
% involves inversing a matrix - instead you should use gradient decent

theta = zeros(size(X, 2), 1);

theta = pinv(X' * X) * X' * y;

end
