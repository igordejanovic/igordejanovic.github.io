---
title: Implementing Martin Fowler's State Machine DSL in textX
---

Well, you know what they say: "You aren't making a DSL tool if you haven't
implemented [Martin Fowler's](http://www.martinfowler.com/aboutMe.html) State
Machine language using your tool yet" ;)

This is a well known DSL example from his book [Domain-Specific
Languages](http://www.martinfowler.com/books/dsl.html). If you are doing stuff
in the field of DSLs you should definitely read this book.  There is an [excerpt
from the book](http://www.informit.com/articles/article.aspx?p=1592379&seqNum=1)
available on-line so I advise you to read it before watching the video below.

Another book which I also highly recommend is [DSL Engineering: Designing,
Implementing and Using Domain-Specific Languages](http://dslbook.org/) by
[Markus Völter](http://voelter.de/about). Also an excelent read, although
oriented more towards modeling languages with graphical syntaxes (a.k.a.
Domain-Specific Modeling), is the book [Domain-Specific Modeling: Enabling Full
Code Generation](http://dsmbook.com/) by [Steven
Kelly](http://www.metacase.com/stevek.html) and [Juha-Pekka
Tolvanen](http://www.metacase.com/jpt.html).

In the video bellow I am explaining the implementation of the Martin Fowler's
State Machine language in [textX](https://github.com/igordejanovic/textX/) by:

  - Specifying the grammar of the language
  - Creating source code generator by generating a nice *dot* state charts
  - Creating model interpreter in Python

This tutorial is a good overview of textX workflow and capabilities but if you
want to see basic introduction together with installation and the first steps I
suggest you to watch [video introduction to
textX](http://igordejanovic.net/2016/05/04/video-introduction-to-textx/) first.

Full source code presented in the video is available at [the project GitHub
repository](https://github.com/igordejanovic/textX/tree/master/examples/StateMachine).
I hope you will enjoy watching this video as much I enjoyed playing with this
little language.

<iframe width="560" height="315"
src="https://www.youtube.com/embed/HI14jk0JIR0" frameborder="0"
allowfullscreen></iframe>



