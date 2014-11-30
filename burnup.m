% Burnup prototype

%
% NOTE this is a prototype
%

%
% Instructions
%
% First, replace the file trainingSet.txt with information about your team.
% The more data the better really.
% Replace the file nextProject.txt with your next project. This should be a
% vector of story points. This does not have to be ordered.
%

% clear any existing bits and bobs
clear ; close all ; clc

%-------------------------------------------------------------------------------
% load the training set
data = load('trainingSet.txt');

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

% loop through vector and assign a number of mins for each task

% sum that time, format it and output it

points = load('nextProject.txt');

number_points = length(points);

Points = [ones(number_points, 1), points];

total_mins = sum(Points * theta);

total = total_mins / mins_in_day;

fprintf('Projected total time: %d person days\n', total);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;
%-------------------------------------------------------------------------------
% linear regression can only really get you so far, try using a polynomial set
% of features

% vary this to get more interesting graphs
p = 8;

% dial this up to stop overfitting
lambda = 1;

% Map X onto Polynomial Features and Normalize
X_poly = polyFeatures(data(:, 2), p);
[X_poly, mu, sigma] = featureNormalize(X_poly);  % Normalize
X_poly = [ones(m, 1), X_poly];                   % Add Ones

fprintf('Normalized Training Example:\n');
fprintf('  %f  \n', X_poly(1, :));

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

[theta] = trainLinearRegression(X_poly, y, lambda);

figure(1);
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
plotFit(min(X), max(X), mu, sigma, theta, p);
xlabel('Story points');
ylabel('Time taken in mins');
title (sprintf('Polynomial Regression Fit (lambda = %f)', lambda));

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

% work out the poly value
points = load('nextProject.txt');
points_poly = polyFeatures(points, p);
[points_poly, mu, sigma] = featureNormalize(points_poly);

number_points = length(points);

points_poly = [ones(number_points, 1), points_poly];

total_mins = sum(points_poly * theta);

total = total_mins / mins_in_day;

fprintf('Projected total time via poly: %d person days\n', total);
