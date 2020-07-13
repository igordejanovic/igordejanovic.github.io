---
title: FLOSS projects
layout: page
sidebar: true
order: 1
---

---

Here are short descriptions of some of my FLOSS projects I like to hack on. I
use these tools in my work, research and teaching [Domain-Specific
Languages](courses.html) course.

### [textX](http://textx.github.io/textX/)

textX is a meta-language (i.e. a language for language definition) for
domain-specific language (DSL) specification in Python inspired by
[Xtext](https://eclipse.org/Xtext/).

From a single grammar description textX automatically builds a meta-model (in
the form of Python classes) and a parser for your language. Parser will parse
expressions on your language and automatically build a graph of Python objects
(i.e. the model) corresponding to the meta-model.

Read more information [here](http://textx.github.io/textX/) or see the project on
[GitHub](https://github.com/textX/textX).


### [parglare](../parglare/)

Parglare is a modern approach to old-school parsing algorithms - LR and GLR. It
uses integrated scanner (a.k.a scannerless parsing), have an extensive support
for debugging, tracing and visualization. For grammar specification a BNF-like
notation is used.

Read more information [here](parglare/) or see the project
on [GitHub](https://github.com/igordejanovic/parglare/).


### [Arpeggio](http://textx.github.io/Arpeggio/)

Arpeggio is recursive descent parser with backtracking and memoization (a.k.a.
pacrat parser) for Python. Arpeggio grammars are based on the PEG formalism.
Arpeggio's main use is a foundation for a tool-chain for DSL development but it
can be used for all sort of general purpose parsing.

It is used as a parsing tehnology for textX.

Read more information [here](http://textx.github.io/Arpeggio/) or see the project on
[GitHub](https://github.com/textX/Arpeggio/).



