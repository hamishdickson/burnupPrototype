function [X_poly] = polyFeatures(X, p)
% X = features
% p = convert to p sized polynomial
% X_poly = output

%% Create a p sized version of X - basically fake new features
%
% HWD 01/12/14
%

X_poly = zeros(numel(X), p);

% loop through and create something bigger
for i = 1:p
    X_poly(:, i) = X .^ i;
end

end
