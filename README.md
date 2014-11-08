burnupPrototype
===============

Note: this is a prototype, once I'm happy with this implementation I will create a web app for this.

Octave implementation of a burnup chart using machine learning.

Features
========

This prototype initially is just using time billed against time of billing.

ie X = [time_billed; time_of_billing]

and y = [time_of_completion]

Details
=======

The idea here is to create burnup charts using machine learning to help pick your teams velocity. This uses linear regression and will aim to predict the "most likely" finish date.

As with all machine learning tools, the more data that can be fed to this the better.

See here for a more detailed explaination for what a burnup chart is http://www.clariostechnology.com/productivity/blog/whatisaburnupchart

Notes this assumes that only a single person is working on the project. It is a bit dumb in that it assumes velocity will be constatnt. This could be resolved with some kind of neural network I guess..... (prototype 2 maybe?)