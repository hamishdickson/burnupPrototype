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

%-------------------------------------------------------------------------------
% great, so right now we have trained a function to know what each story point
% is worth
% Now, take the given vector of story points and use that to work out how many
% "person days" are needed to complete the work
mins_in_day = 60*7; % change this for your business

% be realistic here - what percentage of that time will your team actually code/
% QA/etc?
work_factor = 0.7; % I would say that 0.7 may even be a little high
