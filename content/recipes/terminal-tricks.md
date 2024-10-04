+++
title = "Terminal/shell tricks"
lastmod = 2024-10-04T15:39:46+02:00
rtags = ["linux", "shell", "terminal", "config"]
draft = false
creator = "Emacs 29.4 (Org mode 9.8 + ox-hugo)"
+++

## Useful terminal shortcuts {#useful-terminal-shortcuts}

| Shortcut | What it does?                                                                                               |
|----------|-------------------------------------------------------------------------------------------------------------|
| C-x C-e  | Edits the current line in the $EDITOR program, or vi if undefined.                                          |
| C-x C-r  | Read in the contents of the inputrc file, and incorporate any bindings or variable assignments found there. |
| C-x C-u  | Incremental undo, separately remembered for each line.                                                      |
| C-x C-v  | Display version information about the current instance of bash.                                             |
|          | In zsh switch to line vi mode (equivalent to `bindkey -v`)? Exit with Ctrl-c                                |
| C-x C-x  | Alternates the cursor with its old position. (C-x, because x has a crossing shape).                         |
| C-x \*   | Inline shell expansion                                                                                      |


## [Alacritty](https://alacritty.org/) {#alacritty}

[Alacritty](https://alacritty.org/) is a modern terminal emulator. See [additional config info](https://wiki.archlinux.org/title/Alacritty) in ArchLinux
Wiki.

Install from packages:

```sh
sudo pacman -S alacritty
```

| Shortcut      | What it does?                        |
|---------------|--------------------------------------|
| Ctl-Shift-SPC | Enter vi mode. Press again to leave. |
| Ctl-Shift-C   | Copy selection                       |
| Ctl-Shift-V   | Paste clipboard content              |


### Color schemes with dynamic change {#color-schemes}

Nice color schemes can be found in [alacritty/alacritty-theme](https://github.com/alacritty/alacritty-theme) repo.

```sh
git clone https://github.com/alacritty/alacritty-theme.git ~/.alacritty-colorscheme
```

Color scheme can be applied inside alacritty config:

```toml
import = [
  "~/.alacritty-colorscheme/themes/alabaster_dark.toml"
]
```

To [change theme dynamically](https://wiki.archlinux.org/title/Alacritty):

```sh
alacritty msg config "$(cat ~/path/to/theme.toml)"
```


### Enable URL lookups (regex hints) {#enable-url-lookups--regex-hints}

Triggered by `Ctrl-Shift-U`, then use highlighted letters to choose:

```toml
[[hints.enabled]]
command = "xdg-open"
post_processing = true
regex = "(ipfs:|ipns:|magnet:|mailto:|gemini:|gopher:|https:|http:|news:|file:|git:|ssh:|ftp:)[^\u0000-\u001F\u007F-<>\"\\s{-}\\^⟨⟩`]+"

[hints.enabled.binding]
key = "U"
mods = "Control|Shift"

[hints.enabled.mouse]
enabled = true
mods = "None"
```

Now you can press `Ctrl-Shift-U` to get hints overlay (a letter for each
recognized URL on the terminal). Press the letter to execute `xdg-open` over the
matched content (URL).


### Additional keybindings {#additional-keybindings}


#### Spawn a new instance in the same directory {#spawn-a-new-instance-in-the-same-directory}

```toml
[[keyboard.bindings]]
action = "SpawnNewInstance"
key = "Return"
mods = "Control|Shift"
```


#### Toggle white/dark theme temporarily - e.g. during presentations {#toggle-white-dark-theme-temporarily-e-dot-g-dot-during-presentations}

Make a script `~/bin/alacritty-toggle.sh` for toggling white/dark theme:

```sh
if [ -f ~/.alacritty-white ]; then
        alacritty msg config "$(cat ~/.alacritty-colorscheme/themes/alabaster_dark.toml)"
        rm ~/.alacritty-white
else
        alacritty msg config "$(cat ~/.alacritty-colorscheme/themes/alabaster.toml)"
        touch ~/.alacritty-white
fi
```

Make a keyboard shortcut for the command.

```toml
[[keyboard.bindings]]
key = "F12"

[keyboard.bindings.command]
#args = ["msg", "config", "cat"]
program = "alacritty-toggle.sh"
```


## Tricks with zsh and [oh-my-zsh](https://ohmyz.sh/) {#tricks-with-zsh-and-oh-my-zsh}

-   <https://www.sitepoint.com/zsh-commands-plugins-aliases-tools/>


### Go up to the root of Git repo :oh-my-zsh: {#go-up-to-the-root-of-git-repo-oh-my-zsh}

Put this in `.zshrc`:

```sh
plugins+=(git)
```

This adds alias `grc` that cd to the root of the repo. For other aliases see [here](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git).

[Source](https://stackoverflow.com/a/74648494/2024430).
