---
title: Terminator and Vim love
---

For my day-to-day coding (when I don't code in Java ;) ) I use [vim editor](http://www.vim.org/) and I like it a lot. It is arguably the tool of trade that needs quite amount of time to learn properly but it is surely rewarding. It has some amazing plugins and it is the editor that is installed on your linux servers so knowing at least some basics is almost necessary if you need to do some server administration.

For shell stuff I use [zsh](http://zsh.sourceforge.net/) and great set of configurations/addition [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).  If you haven't try it yet, you don't know what are you missing.

[Terminator](http://gnometerminator.blogspot.rs/p/introduction.html) is my terminal emulator of choice. It has some great features like:

- Vertical and horizontal split (Ctrl+Shift+E, Ctrl+Shift+O)
- Moving among splits (Alt+arrow)
- Resizing splits (Ctrl+Shift+arrow)
- Zooming split (Ctrl+X)
- Increase/decrease font size (Ctrl-+, Ctrl--, Ctrl-0)

I usually open vim inside terminator which gives nice and easy spliting, moving splits, running shell commands. Enviroment very much like those provided with tiling window manager.

Here is how it looks like.

![Terminator + vim in action](/img/posts/terminator-vim-in-action.png)

To make this setup even more easy to use I did simple integration with Doplhin file manager (KDE) to:

1. open directory with the terminator
1. open textual files with vim inside terminator.

To do first make a shell script `terminator-open-dir` with the following content:

    #!/bin/bash
    terminator --working-directory="$@"

Right click on a directory in Dolphin and go to `Properties`, choose `File Type Options` and in the list of application in the lower part of dialog choose `Add` and navigate to `terminal-open-dir` script. Make sure that script has executable flag set.

After this you will be able to `Open with...` directory with terminator.

To open textual file with vim inside terminator make a shell script `terminator-vim` with the following content:

    #!/bin/bash
    terminator --working-directory=`dirname $@` -x vim $@

Repeat the above procedure but this time by right clicking on the file you would like to open with vim.

Here is another nice trick found [here](http://askubuntu.com/questions/2140/is-there-a-way-to-turn-gvim-into-fullscreen-mode).  If you put this in your `.vimrc`

    map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

Pressing `F11` will maximize terminator window and remove all window decorations giving you a nice distraction-free environment for work (you must install `wmctrl` for this to work).


