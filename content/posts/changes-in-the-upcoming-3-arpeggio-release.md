+++
title = "Some important changes in the upcoming releases of Arpeggio/textX parsers"
date = 2023-04-07T20:08:00+02:00
lastmod = 2023-07-08T17:10:17+02:00
ptags = ["textX", "arpeggio", "python"]
type = "post"
draft = false
creator = "Emacs 28.2 (Org mode 9.6.1 + ox-hugo)"
+++

In PEG there is an ordered choice expression which operates by trying each
alternative from left to right, takes the first that succeeds and proceeds never
returning to the following alternatives in case the one chosen proves as
incapable of finishing the parsing process.

Ordered choice might look deceptively similar to regular expressions alternative
match but there is an important difference.

Let's say that we are trying to match `a | ab` and the input is `ab`. Regular
expression engine will try all alternatives and use the one that matches the
longest part of the input, thus the second alternative (`ab`) succeeds. But, PEG
will try alternatives from left to right and choose the first which succeeds, in
this case `a`, leaving `b` in the input unconsumed. A consequence of this is that in
PEG `ab` will never match! It is thus recommended to always order choice
alternatives from the most specific to the most generic (e.g. `ab | a` in this
case).

Another thing to consider are expressions that always succeed (let's call them
_infallible_) and expressions that may match empty (let's call them _nullable_).

Infallible expressions are: `Optional`, `ZeroOrMore`, `RegexMatch` that may match
empty, a `Sequence` of infallibles and `OrderedChoice` where at last one of the
choices is infallible.

All infallible expressions must be nullable but not all nullable expressions are
infallible. For example, lookahead expressions (also called syntactic
predicates) `And` and `Not` never consume the input (thus are nullable) but may
fail, thus are not infallible.

Currently, [Arpeggio](https://github.com/textX/Arpeggio) (and thus [textX](https://github.com/textX/textX)) tries to avoid some pitfalls and deviates
slightly from PEG by using a sort of "soft failure". E.g. consider this ordered
choice:

```text
a? | b
```

<div class="note">

I'm using PEG/regex notation in examples for the sake of brevity.

</div>

And let's say the input is `b`. Current version of Arpeggio tries to match `a` and
then considers the failure to consume the input as a "soft failure" and continue
to match `b` which succeeds.

The problem with this approach is that it clearly violates the PEG approach,
thus defining different language. What is worse, it may misleadingly look to
work as regular expressions which is far from the truth (as demonstrated above
with `a | ab`) and [may confuse both users with PEG as well as regex mental model](https://github.com/textX/Arpeggio/commit/db503c961bb7b4da2eddaf1615f66a193a6f9737#r107103641).

In the upcoming 3.x version of Arpeggio I've changed the way matching is done to
adhere to PEG rules. Thus, each expression either succeeds or not regardless of
whether it consumed any input. This makes reasoning much easier but brings
subtle differences that may break previous grammars. So be aware of these
breaking changes!

First of all, when you have infallible expression as an alternative of an
ordered choice (like in the example above), it will always succeed which would
make further alternatives unreachable.

So, `a? | b` in PEG is always wrong as this expression will never match `b` because
`a?` would succeed by matching empty and the parser would carry on with the next
rule that follows the ordered choice. What you should write is `(a | b)?`.

Thus, the rule of the thumb is to never use infallible rules in choice
alternatives.

The second, more serious problem, is using nullable expressions inside
repetitions (`Zero/OneOrMore`). For example:

```text
(a?)*
```

In the current version of Arpeggio, `ZeroOrMore` also uses "soft failure" and will
terminate matching when there is no input consumed, which kinda shouldn't
introduce any problem. Indeed, I can't think of any problem with this except
that this grammar is not valid from the PEG standpoint as in PEG it introduces
an infinite loop where `ZeroOrMore` repeatedly run nullable match which always
succeeds while consuming nothing which leads the parser to the same state and
thus produce the infinite loop. Also, using "soft failures" selectively
complicates the design of Arpeggio and reasoning about grammars. It is so much
easier to reason about the grammar when expressions either succeed or fail
regardless of their surroundings and whether they consume the input or not.

Why I didn't say _using infallible expression inside repetitions_ then? Well, you
can still make infinite loop by fallible expressions. Consider this:

```text
(!a)*
```

This uses negative lookahead to assert that the next part of the input is not `a`.
And since lookaheads don't consume input, if this is true the parser will loop
forever even though the negative lookahead is not infallible.

Luckily, all these invalid combinations are easy to catch (I think) so, before
the next release, Arpeggio [will have checks in place](https://github.com/textX/Arpeggio/issues/101) that will guide the users
through fixings of the eventual problems in existing grammars that worked
previously.

Thanks to [Stanislav Pankevich](https://github.com/stanislaw) who triggered interesting discussions which lead
to these changes while working on [the better error reporting in Arpeggio/textX](https://github.com/textX/Arpeggio/pull/102).
