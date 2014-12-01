function plotData(x, y)
% x = x coords
% y = y coords

%% plot what we have
%
% HWD 01/12/14
%

% open a new window
figure;

plot(x, y, 'rx', 'MarkerSize', 10);
ylabel('Time taken in mins');
xlabel('Story points given at planning');

end
