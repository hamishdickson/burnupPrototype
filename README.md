burnupPrototype
===============

Note: this is a prototype, once I'm happy with this implementation I will create a web app for this. Please see the todo section to see what I consider is left to work out before I'm happy to take this on to the next stage.

Octave implementation of a burnup chart using some simple machine learning.

Using burnupPrototype
=====================

To use burnupPrototype, you should complete at least two steps

1) replace the data in trainingSet.txt with your team's data from your last agile project. trainingSet.txt consists of pairs of <mins actually spent on story>, <story points>

2) replace the data in nextProject.txt with a vector of story points for your next project. This does not need to be ordered. You should include all your story points.

Once that is done, just run burnup from a matlab/octave session.

Optionally, you should also

3) change lambda to prevent overfitting. lambda can be found in burnup.m. By default this is set to 1.

4) change p (polynomial order) to vary complexity of polynomial fit. p can be found in burnup.m. By default this is set to 8.

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

* output sigma(1), sigma(2) and sigma(3)

* divide up the training set into a test and CV set

* automatically pick p and lamdba

* at the moment this only works with story points. At some point a decision needs to be made about what to do with tasks, bugs etc
