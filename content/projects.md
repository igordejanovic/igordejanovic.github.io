+++
title = "Open-source"
draft = false
creator = "Emacs 29.4 (Org mode 9.8 + ox-hugo)"
[menu]
  [menu.main]
    weight = 1004
    identifier = "open-source"
+++

Here are short descriptions of some of [FOSS](https://en.wikipedia.org/wiki/Free_and_open-source_software) projects I started a while ago. I
use these tools in my work, research and teaching Domain-Specific Languages
course.


## [textX](https://textx.github.io/textX/) {#textx}

textX is a meta-language (i.e. a language for language definition) for
domain-specific language (DSL) specification in Python inspired by
[Xtext](https://eclipse.org/Xtext/).

From a single grammar description textX automatically builds a meta-model (in
the form of Python classes) and a parser for your language. Parser will parse
expressions on your language and automatically build a graph of Python objects
(i.e. the model) corresponding to the meta-model.

Read more information [here](https://textx.github.io/textX/) or see the project on [GitHub](https://github.com/textX/textX).


## [parglare](https://www.igordejanovic.net/parglare/) {#parglare}

Parglare is a modern approach to old-school parsing algorithms - LR and GLR. It
uses integrated scanner (a.k.a scannerless parsing), have an extensive support
for debugging, tracing and visualization. For grammar specification a BNF-like
notation is used.

Read more information [here](https://www.igordejanovic.net/parglare/) or see the project on [GitHub](https://github.com/igordejanovic/parglare/).


## [Arpeggio](https://textx.github.io/Arpeggio/) {#arpeggio}

Arpeggio is recursive descent parser with backtracking and memoization (a.k.a.
pacrat parser) for Python. Arpeggio grammars are based on the PEG formalism.
Arpeggio's main use is a foundation for a tool-chain for DSL development but it
can be used for all sort of general purpose parsing.

It is used as a parsing tehnology for textX.

Read more information [here](https://textx.github.io/Arpeggio/) or see the project on [GitHub](https://github.com/textX/Arpeggio/).


## [Rustemo](https://github.com/igordejanovic/rustemo/) {#rustemo}

Rustemo is a LR/GLR parser generator for Rust which features a clean separation
between its core components: lexers, parsers, and builders. Lexers break an
input sequence into tokens. Parsers perform syntax analysis on the tokens
recognized by the lexer, while builders are responsible for producing the final
output. It is an old-school LR approach with a modern twist. It supports
Generalized LR (GLR) parsing as well.

To learn more read [the docs](https://www.igordejanovic.net/rustemo/) or visit the [project on GitHub](https://github.com/igordejanovic/rustemo/).
