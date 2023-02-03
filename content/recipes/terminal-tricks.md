+++
title = "Terminal/shell tricks"
lastmod = 2023-02-03T10:02:54+01:00
rtags = ["linux", "shell", "terminal", "config"]
draft = false
creator = "Emacs 28.2 (Org mode 9.6 + ox-hugo)"
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


## [Alacritty](https://alacritty.org/) specific {#alacritty-specific}

| Shortcut      | What it does?                        |
|---------------|--------------------------------------|
| Ctl-Shift-SPC | Enter vi mode. Press again to leave. |
| Ctl-Shift-C   | Copy selection                       |
| Ctl-Shift-V   | Paste clipboard content              |


### Regex hints {#regex-hints}

-   Recognizing URLs and executing open command. Put this into
    `~/.config/alacritty/alacritty.yml`:
    ```yaml
      hints:
        enabled:
    ​     - regex: "(ipfs:|ipns:|magnet:|mailto:|gemini:|gopher:|https:|http:|news:|file:|git:|ssh:|ftp:)\
                    [^\u0000-\u001F\u007F-\u009F<>\"\\s{-}\\^⟨⟩`]+"
           command: xdg-open
           post_processing: true
           mouse:
             enabled: true
             mods: None
           binding:
             key: U
             mods: Control|Shift
    ```
    Now you can press `Ctrl-Shift-U` to get hints overlay (a letter for each
    recognized URL on the terminal). Press the letter to execute `xdg-open` over the
    matched content (URL).


### Color schemes with dynamic change {#color-schemes-with-dynamic-change}

Nice color schemes can be found in [eendroroy/alacritty-theme](https://github.com/eendroroy/alacritty-theme) repo.

```sh
git clone https://github.com/eendroroy/alacritty-theme.git ~/.alacritty-colorscheme
```

Link to default location:

```sh
ln -s ~/.alacritty-colorscheme/themes ~/.config/alacritty/colors
```

Color scheme can be applied either statically inside alacritty config:

```yaml
import:
  - ~/.alacritty-colorscheme/themes/{scheme_name}.yaml
```

or dynamically using [alacritty-colorscheme](https://github.com/toggle-corp/alacritty-colorscheme):

```sh
pip install --user alacritty-colorscheme
```

List schemes by:

```sh
alacritty-colorscheme list
```

See current scheme by:

```sh
alacritty-colorscheme status
```

Toggle by:

```sh
alacritty-colorscheme -V toggle wombat.yaml papercolor_light.yaml
```

Make keybinding in `~/.config/alacritty/alacritty.yml`:

```yaml
key_bindings:
  - { key: F12, command: { program: "alacritty-colorscheme", args: ["-V",  "toggle",  "wombat.yaml",  "papercolor_light.yaml"] } }
```


### Spawn a new instance in the same directory {#spawn-a-new-instance-in-the-same-directory}

Add to `~/.config/alacritty/alacritty.yml`:

```yaml
key_bindings:
  - { key: Return,   mods: Control|Shift, action: SpawnNewInstance }
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
