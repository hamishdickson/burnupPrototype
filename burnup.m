% Burnup prototype

% clear any existing bits and bobs
clear ; close all ; clc

% load the training set
data = load('trainingSet1.txt');

X = data(:, 2);
y = data(:, 1);

% don't need this yet, but will need it for multiple features
%[X, mu, sigma] = featureNormalize(X);
%X_poly = polyFeatures(X, 5);

plotData(X, y);

% OK, so remember to add a column of 1s
m = length(y);
X = [ones(m, 1), X];

% init theta
theta = zeros(2, 1);

% compute the initial cost
[J, grad] = computeCost(X, y, theta, 1)

lambda = 1;

[theta] = trainLinearRegression([ones(m, 1) X], y, lambda);

% use the normal equation
theta = normalEqn(X, y)

% plot the linear fit
hold on;
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off;
