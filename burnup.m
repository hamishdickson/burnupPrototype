# Burnup prototype

#TODO .... write this sucker

# first, use just story points vs time taken for each person - then
# create a graph displaying these for X people, using different colors
# to show who is who.

# then, given a whole project, find the quickest period of time the
# project can be completed.

% clear any existing bits and bobs
clear ; close all ; clc

% load the training set
data = load('trainingSet1.txt');

X = data(:, 2);
y = data(:, 1);

% don't need this yet, but will need it for multiple features
%[X, mu, sigma] = featureNormalize(X);

plotData(X, y);

% OK, so remember to add a column of 1s
m = length(y);
X = [ones(m, 1), data(:, 1)];

% init theta
theta = zeros(2, 1);

% compute the initial cost
computeCost(X, y, theta)

% use the normal equation
theta = normalEqn(X, y)

% plot the linear fit
hold on;
plot(X(:,1), X*theta, '-') 
legend('Training data', 'Linear regression') 
hold off;
