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

X = data(:, 1);
y = data(:, 2);

plotData(X, y);
