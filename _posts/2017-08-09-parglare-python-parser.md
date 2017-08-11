---
title: Parglare - A new LR/GLR parser for Python
layout: post
---

With this post I'm announcing availability
of [a new Python parser](https://github.com/igordejanovic/parglare) based on
LR(1) and GLR algorithms.

For years I've been working with and
developing [PEG](https://en.wikipedia.org/wiki/Parsing_expression_grammar) based
parsers (see [Arpeggio](https://github.com/igordejanovic/Arpeggio)
and [textX](https://github.com/igordejanovic/textX)). PEGs have some really nice
properties: they represent a concise description of top-down parsers and are
easy to understand and debug. Furthermore, with choice operator being ordered
PEG grammars can't be ambiguous. Backtracking is natural and easy to implement
giving it unlimited lookahead. A composition of PEG grammars will give a valid
PEG grammar, although
it
[might not be what you would expect](http://tratt.net/laurie/blog/entries/parsing_the_solved_problem_that_isnt.html).

But, there are some drawbacks.

<!--more-->

## PEG drawbacks

First, PEG based parser are naturally implemented as top-down parsers which is
troublesome for left-recursive grammar rules. This leads to unnatural grammar
specification for some languages which would be much easier to describe using
left recursion.

Second, PEG parsers deal with ambiguity by implicitly resolving it with
left-to-right ordered choice operator. This hides ambiguity and forces you to
think imperatively during grammar construction. There are even situations when
there exists no valid order of the rules for the language one wish to describe.
This leads to a problem where you can't be sure what language your grammar
describes.

Third, the most straight-forward way to implement PEG parser is by mutually
recursive function calls. Parser state is thus kept on the program stack which
is not easy to manipulate. This makes error recovery hard to implement. In order
to recover from an error you would have to restore the state where you consumed
the most of the input and try to skip erroneous input or create expected tokens.
Recovering that state would mean to recover the program stack. Another technique
would be to implement explicit stack but that would kill much of the PEG
attractiveness.



## Parglare

With parglare I wanted to keep most of the good stuff from Arpeggio/textX but to
use more robust algorithm with a solid scientific theory and to alleviate some
of the PEG's drawbacks.

LR parsing is invented by Donald Knuth in 1965. It is based on Context-Free
Grammars and Push-Down Automata (PDA) construction process which if successful
proves that the grammar is indeed LR(1) and that any input that correspond to
the grammar can be parsed deterministically.

I wanted parglare to be a scannerless parser. Separate tokenization/scanning
phase leads to a lot of grief. Parglare will recognize tokens on the fly and
given the right parsing context this eliminates a lot of potential source of
lexical ambiguities.

Parsing is a process of transforming a flat sequence of tokens to some other
form, tree being a most common. This doesn't imply that the input must be text
at all. It can be sequence of any objects. Parglare indeed can parse anything by
introducing the concept
of [recognizers](http://www.igordejanovic.net/parglare/recognizers/). You can
also see
in
[this test](https://github.com/igordejanovic/parglare/blob/master/tests/func/test_parse_list_of_objects.py) how
a list of integer is being parsed.

Both Arpeggio and textX provide a handy visualization features which can really
help in understanding the grammar and parsing process. Parglare also
provides [pglr command](http://www.igordejanovic.net/parglare/pglr/) which can
be used to visualize LR automata and GLR parsing trace.

[Grammar language](http://www.igordejanovic.net/parglare/grammar/) is based on a
pure BNF without any extensions at the moment. This might lead to a more verbose
grammar but the actions are really straight-forward to write. In the future a
syntactic sugar will be added for some common idioms.

[Actions](http://www.igordejanovic.net/parglare/actions/) can be called
on-the-fly during parsing or applied on the parser tree afterwards. The parse
tree is built using default actions. Calling actions on the fly is again
something that can hardly be done with PEG parsers because of backtracking.

[Error recovery](http://www.igordejanovic.net/parglare/recovery/) was much
easier to implement as the parser state is explicit. In parglare you can use
built-in error recovery strategy or write your own.

From the same grammar Parglare can construct both LR(1) (modified LALR(1), or
SLR tables) and GLR parser. GLR could be used if the parser needs more than one
token of lookahead to deduce next step or if the language is inherently
ambiguous. In case of ambiguous parse, all trees will be returned by the GLR
parser (a.k.a. the parse forest). Common sub-tree sharing is used which reduce
memory usage significantly. Some common pitfalls with GLR algorithm are taken
care of which
is
[tested using published grammars](https://github.com/igordejanovic/parglare/blob/master/tests/func/test_special_grammars.py) that
are specifically crafted to confuse GLR parser.


Describing everything that can be done with parglare would make this post too
long, so if I've got you interested, you can find more info
in [the docs](http://www.igordejanovic.net/parglare/).


## Where is it heading?

There are a lot of plans for parglare. First I would like to build some optional
syntactic sugar for grammar language that would reduce boiler-plate for some
common idioms. I'm also thinking about providing some implicit transformation to
AST similar to textX. Lexical ambiguity detection for overlapping regexes would
be nice too. And, of course, performance optimization is something that needs to
be tackled from time to time.

But I'll definitely try to keep the core simple and all additions optional.

If you have ideas, advices or any other feedback please use comment section bellow.
