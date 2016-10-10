---
title: PsychoPy, Pyo and PulseAudio
---

Today, while hacking on [pyFlies](https://github.com/igordejanovic/pyFlies) I
run into trouble with the code generated for the
[PsychoPy](http://www.psychopy.org/) backend. `PsychoPy` is using
[Pyo](http://ajaxsoundstudio.com/software/pyo/) to generate sound.  The problem
is that `Pyo` do not support
[PulseAudio](http://www.freedesktop.org/wiki/Software/PulseAudio/), only
[JACK](http://www.jackaudio.org/).  This might be a good choice since `JACK` is
better suited for low latency sound processing, but today most linux distro use
`PulseAudio` which is better suited for general desktops.

In order to use `PsychoPy`, first thing to do is to start `JACK`. Luckily,
there are nice GUI apps to do that easily, e.g.
[QjackCtl](http://qjackctl.sourceforge.net/) or
[cadence](http://kxstudio.linuxaudio.org/Applications:Cadence). Starting `JACK`
will suspend `PulseAudio` while `JACK` is runnning.

Now, we must instruct `pyo` called from `PsychoPy` to use `JACK`. Although,
there is `audio` parameter in `Server` call of pyo lib which could be used to
specify `JACK` as the backend, this would require changing source code of
`PsychoPy`.  There is luckily a non-obtrusive way to achieve the same effect.
Just specify environment variable:

    export PYO_SERVER_AUDIO=jack

Now `pyo` lib will use `JACK` by default and the `PsychoPy` sound will work.




  

  



