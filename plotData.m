function plotData(x, y)

% open a new window
figure;

plot(x, y, 'rx', 'MarkerSize', 10);
ylabel('Time taken in mins');
xlabel('Story points given at planning'); 

end
