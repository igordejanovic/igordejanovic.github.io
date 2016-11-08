---
title:  My Spacemacs Odyssey
layout: post
---

I'm a long time vim user and I just love vim modal editing approach. But, I
always admired Emacs extensibity, introspection and self-documenting
capabilities. Although I gave Emacs a try couple of times in the past I just
couldn't get used to non-modal editing and cumbersome finger-stretching keyboard
bindings. For some time I was keeping an eye
on [spacemacs](http://spacemacs.org/), emacs distribution geared towards vim
users. It looked like a perfect blend of vim and emacs so I gave it a try.

Although spacemacs is still beta the switch-over was surprisingly smooth. It
took me just a few days to get to the speed thanks
to [Evil mode](https://www.emacswiki.org/emacs/Evil), a vim-like modal editing
support which is enabled by default in spacemacs. Evil works remarkably good,
even some often used plugins are ported like, for
example, [surround](https://github.com/tpope/vim-surround).

<!--more-->

First impression are default settings which are most of the time just what I
want. Configuration is done in `.spacemacs` file which is well organized and
commented. Much of the functionality is accessible using key combination
starting with space bar (hence the name of the distribution) following by a
letter which is easy to remember most of the time (`SPC b` - for buffer actions,
`SPC f` - for file actions, `SPC p` - for project actions etc.). If you don't
know the right key that proceeds a helpful popup is displayed with the keys that
can be tried next (thanks
to [which-key](https://github.com/justbur/emacs-which-key)). You can easily ask
emacs to describe keybindings, key, package, function (`SPC d` and than `b` for
bindings, `k` for keys, `p` for package, `f` for function, `v` for variable, `m`
for mode). Help on anything is triggered with `SPC F1`. In all cases a fuzzy
searchable list is displayed thanks
to [helm](https://github.com/emacs-helm/helm) package (Emacs incremental
completion and selection narrowing framework).

You can quickly toggle some settings using `SPC t` prefix and than appropriate
letter. For example to turn on/off indent guide use `SPC t i`. To directly call
emacs lisp function use `M-x` and than type the part of the name.

Of course, configuration, keybindings, moving around and editing is just a part
of the story. We all depend heavily on various plugins and extensions that makes
our life easier. Here are some comments on few of them.

# Helm

[Helm](https://github.com/emacs-helm/helm) is emacs incremental completion and
selection narrowing framework. It is integrated with most packages that provides
a list to select from. I was very impressed by
a [helm-swoop](https://www.emacswiki.org/emacs/HelmSwoop) functionality which I
use know most of the time to search inside the buffer.

The functionality similar to this can be achieved in vim
using [unite](https://github.com/Shougo/unite.vim) but helm feels more powerful
and better integrated with the rest of the editor.

# Magit

For git in vim I used [fugitive](https://github.com/tpope/vim-fugitive) which is
great. In emacs a standard package is [Magit](https://github.com/magit/magit). I
find Magit to be as capable as fugitive or even more with a much easier to learn
interface. Keybindings are easier to grasp and the way of work is just more
logical. For fugitive It took me quite some time to get to the speed.

To call magit status use `SPC g s` or to call magit menu `SPC g m`. `SPC g` is
prefix for some of the Magit commands. Check out blame mode, it is really nice
`SPC g b`.


# flycheck

Flycheck is syntax checker for emacs. I didn't have to do much to have it
working. It *just works*. For various programming languages you have to install
external tools. Check the docs.

# Yasnippet

In vim I used [Ultisnips](https://github.com/SirVer/ultisnips) plugin for
snippets. In spacemacs the default
is [yasnippet](https://github.com/joaotavora/yasnippet). Yasnippet provides you
what you would expect from a capable snippet/template engine. You can create new
snippet by calling `yas-new-snippet` function. In the snippet buffer you can
test the snippet `C-c C-t` and save it with `C-c C-c` when you are satisfied
with the result. Nice feature of yasnippet is that you can use any emacs lisp
expression on entered text which gives you great flexibility on what can be done
with the engine. Ultisnips use Python for similar feature.


# Org mode

And last but not least is [Org mode](http://orgmode.org/). If there is one
package that is worth using emacs for it's this one. I could say that it blew my
mind and changed the way I work. I knew for this gem a long time ago and
actually used [its vim clone](https://github.com/jceb/vim-orgmode) but emacs
Org mode is just fantastic. This tool let you organize all your notes, todos,
schedules in hierarchical structure in plain text files while giving you agenda
and todo list overview over all files. It provides you with time tracking and
pomodoro technique all in the same context. It let you work with tables
seamlessly just as you would edit actual spreadsheet. It really
facilitates [GTD](http://gettingthingsdone.com/) very well. Now I do all my work
organization, note-taking activities and time-tracking in a set of Org mode
files.


# At the end

All in all, this was a pleasant experience for me. After a two weeks of using
spacemacs I can say that I feel fully productive and the journey has just
begun. I still get impressed by spac(emacs) features every day. Although still
in beta it is really well thought-out distribution with a nice configuration and
set of defaults and packages.

Furthermore, default Evil mode gives me opportunity to nurture and don't forget
my vim-fu.


