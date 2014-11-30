function [X_poly] = polyFeatures(X, p)

% turn a boring linear set of features into a nonlinear one

X_poly = zeros(numel(X), p);

for i = 1:p
    X_poly(:, i) = X .^ i;
end

end
