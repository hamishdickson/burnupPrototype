function [X_norm, mu, sigma] = featureNormalize(X)

X_norm = X;

mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

mu = mean(X);
sigma = std(X);

muAll = repmat(mu, size(X, 1), 1);
sigmaAll = repmat(sigma, size(X, 1), 1);

X = X - muAll;

X_norm = X ./ sigmaAll;

end
