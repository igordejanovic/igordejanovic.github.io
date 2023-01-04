+++
title = "Debugging Elisp"
date = 2022-12-31T13:36:00+01:00
lastmod = 2023-01-03T22:20:02+01:00
rtags = ["emacs", "programming"]
draft = false
creator = "Emacs 28.2 (Org mode 9.6 + ox-hugo)"
+++

## print debugging {#print-debugging}


## `debug` {#debug}

`debug` is a Lisp machine stack back-trace debugger.

Usual workflow:

1.  Choose the way to initiate debugger. E.g. call `debug-on-entry` and choose a
    function. See bellow for other options.
2.  Do some operation that should eventually call the function.
3.  In the backtrace inspect the state, step through, look at locals, evaluate
    expressions etc. See bellow for useful shortcuts.

<!--listend-->

Initiating debugger - useful shortcuts/functions
: -   `debug-on-error` - enters the debugger if an error is found.
    -   `debug-on-entry` - starts debugger when entering the given function. Multiple
        function can be given by calling this function many times. To remove a
        function use `cancel-debug-on-entry`.
    -   `debug-on-message` - this is a variable. If non-nil it is interpreted as a
        regex which is matched against printed messages and it breaks into debugger
        if a match is found. Useful if you see a message printed and would like to
        investigate the location.
    -   `debug-watch` - run debugger when variable changes. To remove use function
        `cancel-debug-watch`.
    -   In addition, a call to `(debug)` can be used in the code to break into
        debugger. Thus, find a place where `debug` call won't introduce side-effects
        and insert it. Don't forget to re-evaluate `defun` after change (`eval-defun`).
        Also, don't forget to remove `(debug)` call and re-evaluate `defun` again when
        finished debugging.


Useful shortcuts/functions in the backtrace buffer
: -   `g l - debugger-list-functions` - list function instrumented to break into.
    -   `p - debugger-toggle-locals` - show/hide local variables for the given stack
        frame.
    -   `z o - backtrace-multi-line` - pretty-print the stack backtrace line.
    -   `z c - backtrace-single-line` - returns to a single line representation (undo
        previous).
    -   `g b - debugger-frame` - request entry to debugger when the frame exits. Will
        be marked with asterisk at the left side.
    -   `u - debugger-frame-clear` - undo previous command.
    -   `d - debugger-step-through` - make a step through subexpressions evaluations.
    -   `c - debugger-continue` - continue evaluating without stopping. Stop on the
        next marked frame with `debugger-frame`.
    -   `r - debugger-return-value` -
    -   `E - debugger-eval-expression` - evaluate given expression in the context of
        the stack frame at point. For investigating local variables see
        `debugger-toggle-locals` above. _This should be checked!_
    -   `backtrace-goto-source` - this should go to the source location of the current
        stack frame, but [it's not working at the moment](https://emacs.stackexchange.com/questions/64926/emacs-elisp-debugger-how-do-i-make-the-debugger-jump-to-source-when-i-press-s) which is pity as it would
        really make a huge difference.


## `edebug` {#edebug}

`edebug` is a source-level debugger. It provides a step-by-step execution through
the source code.

Breaking into debugger is performed using the code instrumentation, i.e. the
original code is replaced with a slightly modified code which calls the
debugger.

Useful shortcuts/functions
: -   `SPC u , e d - eval-defun` with universal prefix - instrument current
        function. Evaluating without the prefix will remove instrumentation.


### Tracing {#tracing}

`edebug` can record an execution trace capturing in a `*edebug-trace*` buffer each
function called with parameters and return values.

Set `edebug-trace` to non-nil to enable this mode.

This is handy to find out a call path to the interesting place for investigation.


## profiling {#profiling}

Profiling is used to figure out why the code is running slow and to find
critical places to optimize.

But, I find it also a convenient method to figure out a flow of control inside
of a piece of complex code I'm not familiar with. I just run the profiler and
then invoke a functionality I would like to investigate. After that, profiler
will give me a nice tree of calls so I will quickly be able to figure out what
functions are important and their dependencies.

_Is navigation to the exact location in the source code possible?_

To start the profiler run `profiler-start`. Then, invoke functionality that is
under inspection. After that run `profiler-report` to get the report. Don't forget
to run `profiler-stop` as the profiler introduces small run-time overhead.


## References {#references}

-   Emacs Info on Elisp - `SPC h i or M-x info` - follow `Elisp` and then `Debugging`.
