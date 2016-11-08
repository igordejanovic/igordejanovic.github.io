---
title: Screencasting in ArchLinux
layout: post
---

Today I put some time in setting a screenrecording environment on my main
machine.  My idea is to record some screencasts of creating Domain-Specific
Languages in [textx](https://github.com/igordejanovic/textX).

For main screen recorder I choose
[SimpleScreenRecorder](http://www.maartenbaert.be/simplescreenrecorder/).  It
is simple, fast, easy to setup, and it is available in the binary repository so
it is just a

    sudo pacman -S simplescreenrecorder

away.


<!--more-->

A nice addition to screencast is a small webcam image in the corner. I find a
screencast more personal and appealing when I can actually see a presenter.  I
tried several webcam apps but all of them was to much for what I was trying to
do. At the end I settled on [xawtv](https://www.kraxel.org/blog/linux/xawtv/).
It is simple, no frills application that do just what I needed. It is also
available in the binary repositories. After installation call it with

    xawtv -c /dev/video0

I use KDE so it was fairly easy to remove border and put it on top of other
windows so that is is always visible.

In addition, I enabled `Zoom` desktop effect so that I can zoom on the place
where the mouse is.

Also, I installed `screenkey` application which is very useful if key presses
are important for the presentation. This application will print all key presses
in the overlay window.  This application is not available in the binary
repositories but [it is on the
AUR](https://aur.archlinux.org/packages/screenkey/).  So if you have `yaourt`
installed it would be

    yaourt -S screenkey

The end result is shown in the screenshot bellow and I hope that some
screencasts will appear here shortly.

![Webcam screenshot](/img/posts/webcam-screenshot.png)



