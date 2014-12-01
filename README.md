burnupPrototype
===============

Note: this is a prototype, once I'm happy with this implementation I will create a web app for this. Please see the todo section to see what I consider is left to work out before I'm happy to take this on to the next stage.

Octave implementation of a burnup chart using some simple machine learning.

Features
========

This prototype takes the story points for your last project and compares it against the time billed ie

X = [story points]

y = [mins billed]

This will be expanded over time to take far more features

More Details
============

Let's face it - most software projects are discrete chunks of work. Before we start working on a project we need to justify the time it will take to our steakholders (mmmmm steak).

The central idea for this project is to help with that and create a justifiable estimate of how long your project will take based on previous projects.

Right now, this isn't a true burn up chart - it gives you

1) a linear best fit of the number of story points vs time billed

![alt tag](https://github.com/hamishdickson/burnupPrototype/blob/master/screen-shots/linear-fit.png)

2) a non-linear best fit of the same thing. This in theory should be more accurate.

![alt tag](https://github.com/hamishdickson/burnupPrototype/blob/master/screen-shots/poly-fit.png)

3) predictions of how long the project should take (in person days)

![alt tag](https://github.com/hamishdickson/burnupPrototype/blob/master/screen-shots/console-output.png)

Important notes
===============

As with all machine learning tools, the more data that can be fed to this the better.

See here for a more detailed explaination for what a burnup chart is http://www.clariostechnology.com/productivity/blog/whatisaburnupchart

You should absolutely adjust the variables lambda and p in burnup.m - lambda acts a bit like a buffer in the non-linear best fit calculations to stop the line from overfitting the data (ie your data is very unlikely to be consistent, if you have enough data, there should be a spread of results. lambda is used to stop the non-linear line from taking your results too literally)

TODO
====

** output sigma(1), sigma(2) and sigma(3)

** divide up the training set into a test and CV set

** automatically pick p and lamdba
