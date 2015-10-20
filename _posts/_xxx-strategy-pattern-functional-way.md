---
title: Strategy pattern in Python
---

Recently I had a task to process some large textual files where processing was line based, i.e. each file is read line by line and a set of transformation is applied to each line.
Files had to be unzipped first, moved to some folder structure and possibly renamed.

First, I had to introduce some tool to help with the overall process. For that purpose the [snakemake]() had fit the bill perfectly. It is a make-like tool for Python. It is much more powerful than traditional GNU make and enables writing processing rules in shell and Python.

Now, the transformation part is structured as a generic file/line iteration and application of line-based transformation.


  code

Transformations itself are a fine example of [Strategy Design Pattern](). Each transformation is one strategy/algorithm applied to a line of text. In the classic OOP world a strategy is made as a class with some method that is called to carry out given algorithm.

    code

But, Python is multi-paradigm language and there are some functional trick that makes strategy pattern much more elegant or, we could say, non-existing.
Instead of supplying transformations as instances of concrete strategy classes, why not just pass a function as the functions in Python are first-class objects.


    code


This is fine if you don't have to configure each transformation but what if the transformation has its configuration.

For example, in the `map_chars` transformation we need to supply a char mapping we want to use. Our transformation function accepts a single string and return a string.

    ...code


For this we need to use higher order functions and closures. Basically, we make a function that will accept configuration parameters and return a transformation function with the given configuration.


    ...code

Since there is a bunch of transformation function that can be made lets make their implementation more convenient by introduction decorator that will do the above job for us.

    .. code

Now, for each new transformation function just make sure it is decorated with ``.


And the transformation function are created by calling them with configuration parameters

    ... code


The code is available at [github]().

