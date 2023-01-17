+++
title = "Sway config"
lastmod = 2023-01-17T11:47:11+01:00
rtags = ["linux", "config", "wayland"]
draft = false
creator = "Emacs 28.2 (Org mode 9.6 + ox-hugo)"
+++

Migrating to sway/wayland from i3wm/X. This bellow is my sway config. It can be
[tangled](https://orgmode.org/manual/Extracting-Source-Code.html) with [Org Mode](https://orgmode.org/) to appropriate locations. See [the source of this site](https://github.com/igordejanovic/igordejanovic.github.io/blob/main/site.org).

See <https://wiki.archlinux.org/title/Sway>

Put a warning at the beginning of the tangled file just to be sure not to forget.

```cfg
#Warning: this config is maintained through Org Mode file. Do not edit directly!
```


## Install {#install}

```sh
sudo pacman -S wayland xorg-xwayland sway swaylock swaybg
```

See other sections for the installation of other tools used in this config.

The standard location of sway config is `~/.config/sway/config`.


## Some variables used in the config {#some-variables-used-in-the-config}

```cfg
set {
```

`Mod4` is the `Win` key on most keyboards. Since it is unused for other purposes it
is ideal to be a sway modifier key.

```cfg
    $mod Mod4
```

Sway config root.

```cfg
    $sway ~/.config/sway
```

A script to handle lock/suspend.

```cfg
    $exit $sway/exit.sh
```

A script for managing multiple displays. See [bellow](#display-profile).

```cfg
    $display_profile $sway/display-profile.sh
```

Socket used for [wob](https://github.com/francma/wob), a tool for creating overlay bar during setting of volume,
screen brightness etc. Create it with `mkfifo`. See the README of the project. See
[bellow for the usage](#media-buttons).

```cfg
    $SWAYSOCK.wob ~/.local/share/sway-wob.sock
```

```cfg
}
```


## Windows setup {#windows-setup}

Use minimal borders.

```cfg
default_border pixel 2
```

Use Mouse+$mod to drag floating windows to their wanted position.

```cfg
floating_modifier $mod
```

Background color.

```cfg
output "*" bg "#002244" solid_color
```

Font for window titles and swaybar.

```cfg
font pango:Hack 10
```


## Basic keybindings {#basic-keybindings}

Start alacritty terminal:

```cfg
bindsym $mod+Return exec alacritty
```

Screenshot can be taken with [grim](https://github.com/emersion/grim) which uses [slurp](https://github.com/emersion/slurp) to select a region and then
open the captured image in [gthumb](https://wiki.gnome.org/Apps/gthumb):

```cfg
bindsym Print exec grim -g "$(slurp)" ~/screenshot.png && gthumb ~/screenshot.png
```

Kill focused window:

```cfg
bindsym $mod+Shift+q kill
```

Switch back and forth between workspaces:

```cfg
workspace back_and_forth yes
bindsym $mod+tab workspace back_and_forth
```

Change focus (use vim bindings).

```cfg
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right
```

Move focused window (vim bindings):

```cfg
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right
```

Split in horizontal and vertical orientations. When pressing a hint is displayed
on the window where the next application will be positioned.

```cfg
bindsym $mod+b split h
bindsym $mod+v split v
```

Toggle fullscreen mode for focused window:

```cfg
bindsym $mod+f fullscreen toggle
```

Change container layout (stacked, tabbed, toggle split):

```cfg
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split
```

Toggle tiling/floating:

```cfg
bindsym $mod+Shift+space floating toggle
```

Change fofuc between tiling/floating windows

```cfg
bindsym $mod+space focus mode_toggle
```

Focus the parent/child container:

```cfg
bindsym $mod+a focus parent
bindsym $mod+Shift+a focus child
```

Reload configuration file:

```cfg
bindsym $mod+Shift+r reload
```

Exit sway. Log out of wayland session:

```cfg
bindsym $mod+Shift+e exec "swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your wayland session.' -B 'Yes, exit sway' 'swaymsg exit'"
```


## Workspaces and window associations {#workspaces-and-window-associations}

Define names for default workspaces for which we configure key bindings later on. We use variables to avoid repeating the names in multiple places.

```cfg
set $ws1 "1:editor"
set $ws2 "2:browser"
set $ws3 "3:message"
set $ws4 "4:files"
Set $ws5 "5:"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10:music"
```

Switch to workspace:

```cfg
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10
```

Move workspace to left/right output:

```cfg
bindsym $mod+Shift+Alt+h move workspace to output left
bindsym $mod+Shift+Alt+l move workspace to output right
```

You can map workspace to output using this. Can be handy in multi-display
setups.

```cfg
workspace "1:editor" output DP1 eDP1
workspace "2:browser" output DP1 eDP1
```

Assign application window classes to workspaces:

```cfg
assign [class="Viber"] "3:message"
assign [class="Skype"] "3:message"
assign [class="Audacious"] "10:music"
```

_TODO: Write how to get the name of the application class._

Send curent workspace to other output:

```cfg
bindsym $mod+o exec swaymsg -t get_outputs | \
        jq '.[] | select(.focused!=true) | .name' | head -n1 | xargs swaymsg move workspace to
```

[Source](https://github.com/swaywm/sway/issues/4346)

Move focused container to workspace:

```nil
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10
```


## Media buttons with bar overlay {#media-buttons}

Install [wob](https://github.com/francma/wob):

```sh
sudo pacman -S wob
```

Setup named pipe/socket (do this once):

```sh
mkfifo ~/.local/share/sway-wob.sock
```

Connect socket to wob in the config:

```cfg
exec tail -f $SWAYSOCK.wob | wob
```


### Screen brightness {#screen-brightness}

Install [light](https://github.com/haikarainen/light):

```sh
sudo pacman -S light
```

Call light on brightness keys and pipe to wob:

```cfg
bindsym XF86MonBrightnessUp exec light -A 10 && light -G | cut -d'.' -f1 > $SWAYSOCK.wob
bindsym XF86MonBrightnessDown exec light -U 10 && light -G | cut -d'.' -f1 > $SWAYSOCK.wob
```


### Media player controls {#media-player-controls}

Install [playerctl](https://github.com/altdesktop/playerctl):

```sh
sudo pacman -S playerctl
```

Call playerctl on media keys:

```cfg
bindsym XF86AudioPlay exec playerctl play-pause
bindsym XF86AudioStop exec playerctl stop
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous
```


### Sound volume {#sound-volume}

Install [pamixer](https://github.com/cdemoulins/pamixer):

```sh
sudo pacman -S pamixer
```

Call pamixer on volume keys and pipe to wob:

```cfg
bindsym XF86AudioRaiseVolume exec pamixer -ui 5 && pamixer --get-volume > $SWAYSOCK.wob
bindsym XF86AudioLowerVolume exec pamixer -ud 5 && pamixer --get-volume > $SWAYSOCK.wob
bindsym XF86AudioMute exec pamixer --toggle-mute
```


## Window resizing {#window-resizing}

```cfg
# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode
        bindsym {
          h resize shrink width 10 px or 10 ppt
          j resize grow height 10 px or 10 ppt
          k resize shrink height 10 px or 10 ppt
          l resize grow width 10 px or 10 ppt

          # back to normal: Enter or Escape or $mod+r
          Return mode "default"
          Escape mode "default"
          $mod+r mode "default"
        }
}
bindsym $mod+r mode "resize"
```


## System mode {#system-mode}

```cfg
set $mode_system System (l) lock, (e) logout, (s) suspend, (r) reboot, (Shift+s) shutdown
mode "$mode_system" {
    bindsym l exec $exit lock; mode "default"
    bindsym e exec $exit logout
    bindsym s exec $exit suspend; mode "default"
    bindsym r exec systemctl reboot
    bindsym Shift+s exec systemctl shutdown

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+End mode "$mode_system"
```

Exit script which locks and unmounts encFS mounts on suspend.

```sh
lock() {
    swaylock -c 003300
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        swaymsg 'exit'
        ;;
    suspend)
        lock && encfs -u ~/Consulting && encfs -u ~/.ssh && ssh-add -D && systemctl suspend
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend}"
        exit 2
esac

exit 0
```


## Display mode {#display-profile}

Screen modes by location.

**Note:** mirroring is not [yet properly supported by sway](https://github.com/swaywm/sway/issues/1666) but there is [wl-mirror](https://github.com/Ferdi265/wl-mirror) as
a workaround. See also [this](https://bbs.archlinux.org/viewtopic.php?id=245038).

```cfg
set $mode_display LOCATION: (l)aptop (h)ome (m)eeting (d)ual dual-(r)ight (p)res-low
mode "$mode_display" {
     bindsym {
             l exec $display_profile laptop, mode "default"
             h exec $display_profile home, mode "default"
             d exec $display_profile dual, mode "default"
             r exec $display_profile dual-right, mode "default"
             m exec $display_profile meeting, mode "default"
             p exec $display_profile pres-lowres, mode "default"

             # back to normal: Enter or Escape
             Return mode "default"
             Escape mode "default"
     }
}
bindsym $mod+x mode "$mode_display"
```

Mirroring of output can be done with:

```sh
wl-mirror eDP-1
```

To mirror only a part of the output combine with slurp:

```sh
wl-mirror -r "$(slurp)"
```


### `display-profile` script {#display-profile-script}

```sh
# Set display profiles for various locations.
# WARNING! This script is maintained through Org Mode file. Do not edit directly.

LOCATION=$1
LAPTOP_OUTPUT=eDP-1
LAPTOP_MODE=`swaymsg -t get_outputs | jq ".[] | select(.name==\"$LAPTOP_OUTPUT\") | .modes[-1]"`
LAPTOP_RES=`echo $LAPTOP_MODE | jq ".width"`x`echo $LAPTOP_MODE | jq ".height"`
LAPTOP_WIDTH=`echo $LAPTOP_MODE | jq ".width"`

# Get auxiliary output
AUX_OUTPUT_JSON=`swaymsg -t get_outputs | jq ".[] | select(.name!=\"$LAPTOP_OUTPUT\")"`
AUX_MODE=`echo $AUX_OUTPUT_JSON | jq ".modes[0]"`
AUX_OUTPUT=`echo $AUX_OUTPUT_JSON | jq ".name"`
AUX_RES=`echo $AUX_MODE | jq ".width"`x`echo $AUX_MODE | jq ".height"`
AUX_WIDTH=`echo $AUX_MODE | jq ".width"`

echo $LAPTOP_OUTPUT
echo $LAPTOP_RES
echo $LAPTOP_WIDTH
echo $AUX_RES
echo $AUX_OUTPUT
echo $AUX_RES

move_workspaces_to_output(){
    OUTPUT=$1
    for i in {1..10}
    do
        swaymsg "[workspace=$i]" move workspace to output $OUTPUT
    done
}

case "$LOCATION" in
    "laptop")
        swaymsg output $LAPTOP_OUTPUT enable pos 0 0 res $LAPTOP_RES
        swaymsg output $AUX_OUTPUT disable
    ;;

    "home")
        swaymsg output $AUX_OUTPUT enable pos 0 0 res $AUX_RES, \
                output $LAPTOP_OUTPUT disable
    ;;

    "dual")
        swaymsg output $AUX_OUTPUT enable pos 0 0 res $AUX_RES scale 1, \
                output $LAPTOP_OUTPUT enable pos $AUX_WIDTH 0
        move_workspaces_to_output $LAPTOP_OUTPUT
    ;;

    "dual-right")
        swaymsg output $AUX_OUTPUT enable pos $AUX_WIDTH 0 res $AUX_RES scale 1, \
                output $LAPTOP_OUTPUT enable pos 0 0
        move_workspaces_to_output $LAPTOP_OUTPUT

    ;;

    "meeting")
        swaymsg output $AUX_OUTPUT enable pos $AUX_WIDTH 0 res $AUX_RES scale 1.5, \
                output $LAPTOP_OUTPUT enable pos 0 0
        move_workspaces_to_output $LAPTOP_OUTPUT
    ;;

    "pres-lowres")
        swaymsg output $AUX_OUTPUT enable pos $LAPTOP_WIDTH 0 res 1280x1024, \
                output $LAPTOP_OUTPUT enable
        move_workspaces_to_output $LAPTOP_OUTPUT
    ;;

esac
```


## waybar {#waybar}

Config sway to use waybar.

```cfg
bar {
       swaybar_command waybar
}
```

Install font `Hack Nerd` used for swaync notification icons.

```sh
sudo pacman -S ttf-hack-nerd
```

Waybar configuration:

```cfg
{
    "layer": "top",
    "position": "bottom",

    "modules-left": [
        "sway/workspaces",
        "custom/right-arrow-dark",
    "sway/mode"
    ],
    //"modules-center": [
        // "custom/left-arrow-dark",
        // "custom/weather",
        //"custom/left-arrow-light",
        //"custom/left-arrow-dark",
        //"clock#1",
        //"custom/left-arrow-light",
        //"custom/left-arrow-dark",
        //"clock#2",
        //"custom/right-arrow-dark"
        // "custom/right-arrow-light",
        //"clock#3",
        //"custom/right-arrow-dark",

    //],
    "modules-right": [
        "custom/left-arrow-dark",
        "network",
        "custom/left-arrow-light",
        "custom/left-arrow-dark",
        "memory",
        "custom/left-arrow-light",
        "custom/left-arrow-dark",
        "cpu",
        "custom/left-arrow-light",
        "custom/left-arrow-dark",
        "battery",
        "custom/left-arrow-light",
        "custom/left-arrow-dark",
        "pulseaudio",
        "custom/left-arrow-light",
        "custom/left-arrow-dark",
//      "idle_inhibitor",
        "custom/notification",
        "custom/left-arrow-light",
        "custom/left-arrow-dark",
        "sway/language",
        "custom/left-arrow-light",
        "custom/left-arrow-dark",
        "tray",
        "custom/weather",
        "custom/left-arrow-light",
        "custom/left-arrow-dark",
        "clock#2",
        "custom/right-arrow-dark"
    ],

    "custom/left-arrow-dark": {
        "format": "",
        "tooltip": false
    },
    "custom/left-arrow-light": {
        "format": "",
        "tooltip": false
    },
    "custom/right-arrow-dark": {
        "format": "",
        "tooltip": false
    },
    "custom/right-arrow-light": {
        "format": "",
        "tooltip": false
    },

    "sway/workspaces": {
        "disable-scroll": true,
        "format": "{name}"
    },

    "clock#1": {
        "format": "{:%a}",
        "tooltip": false
    },
    "clock#2": {
        "format": "{:%H:%M}",
        "tooltip": false
    },
    "clock#3": {
        "format": "{:%d-%m}",
        "tooltip": false
    },
    "custom/weather": {
        "exec": "curl 'https://wttr.in/?format=1' -s | cut -c 1-6,9-15",
        "interval": 3600
    },
    "sway/language": {
        "format": "{}",
        "max-length": 5,
        "min-length": 5,
    },
    "pulseaudio": {
        "format": "{icon} {volume:2}%",
        "format-bluetooth": "{icon}  {volume}%",
        "format-muted": "MUTE",
        "format-icons": {
            "headphones": "",
            "default": [
                "",
                ""
            ]
        },
        "scroll-step": 5,
        "on-click": "pamixer -t",
        "on-click-right": "pavucontrol"
    },
    "memory": {
        "interval": 5,
        "format": "Mem {}%"
    },
    "cpu": {
        "interval": 5,
        "format": "CPU {usage:2}%"
    },
    "battery": {
        "states": {
            "good": 95,
            "warning": 30,
            "critical": 15
        },
        "format": "{icon} {capacity}%",
        "format-icons": [
            "",
            "",
            "",
            "",
            ""
        ]
    },
  "network": {
      // "interface": "wlp2*", // (Optional) To force the use of this interface
      "interval": 3,
      "format-wifi": "{essid} ({signalStrength}%, {bandwidthDownBits}|{bandwidthUpBits}) ",
      "format-ethernet": "{ifname}: {ipaddr}/{cidr} ({bandwidthDownBits}|{bandwidthUpBits}) ",
      "format-linked": "{ifname} (No IP) ",
      "format-disconnected": "Disconnected ⚠",
      "format-alt": "{ifname}: {ipaddr}/{cidr}"
  },
  "idle_inhibitor": {
          "format": "{icon}",
          "format-icons": {
              "activated": "",
              "deactivated": ""
          }
  },
  "custom/notification": {
          "tooltip": false,
          "format": "{icon}",
          "format-icons": {
                  "notification": "<span foreground='red'><sup></sup></span>",
                  "none": "",
                  "dnd-notification": "<span foreground='red'><sup></sup></span>",
                  "dnd-none": ""
          },
          "return-type": "json",
          "exec-if": "which swaync-client",
          "exec": "swaync-client -swb",
          "on-click": "swaync-client -t -sw",
          "on-click-right": "swaync-client -d -sw",
          "escape": true
        },

   "tray": {
        "icon-size": 20
   }
}
```


### css {#css}

```css
** {
    font-size: 15px;
    font-family: monospace;
}

window#waybar {
    background: #292b2e;
    color: #fdf6e3;
}

#custom-right-arrow-dark,
#custom-left-arrow-dark {
    color: #1a1a1a;
}
#custom-right-arrow-light,
#custom-left-arrow-light {
    color: #292b2e;
    background: #1a1a1a;
}

#workspaces,
#clock.1,
#clock.2,
#clock.3,
#custom-weather,
#custom-notification,
#language,
#pulseaudio,
#backlight,
#memory,
#cpu,
#temperature,
#network,
#battery,
#tray {
    background: #1a1a1a;
}

#workspaces button {
    padding: 0 2px;
    color: #fdf6e3;
}
#workspaces button.focused {
    color: #268bd2;
}
#workspaces button.urgent {
      background: #aa0000;
}
#workspaces button:hover {
    box-shadow: inherit;
    text-shadow: inherit;
}
#workspaces button:hover {
    background: #1a1a1a;
    border: #1a1a1a;
    padding: 0 3px;
}

#mode {
      background: #aa0000;
}

#pulseaudio {
    color: #268bd2;
}
#backlight {
    color: #b58900;
}
#memory {
    color: #2aa198;
}
#temperature {
    color: #b58900;
}
#cpu {
    color: #6c71c4;
}
#battery {
    color: #859900;
}
#battery.discharging {
      color: #dd9900;
}
#network {
  color: #8599aa;
}
#custom-notification {
  font-family: "NotoSansMono Nerd Font";
}

#mode,
#clock,
#pulseaudio,
#backlight,
#memory,
#cpu,
#custom-notification,
#custom-weather,
#temperature,
#battery {
    padding: 0 10px;
}
```


## Application launcher, window switcher {#application-launcher-window-switcher}

[Rofi](https://github.com/davatorium/rofi) is a popular application launcher and window switcher. See also [ArchLinux
wiki page](https://wiki.archlinux.org/title/Rofi).

Currently original rofi has no support for wayland. There is a fork with wayland
support. Install with:

```sh
yay -S --mflags "--nocheck" rofi-lbonn-wayland
```

`--nocheck` is needed at the moment as there is [a problem with libnkutils](https://github.com/lbonn/rofi/issues/63). If you
are reading this in a fairly distant future probably you won't need this.

Keyboard shortcut.

```cfg
bindsym $mod+d exec rofi -modes combi -show combi -combi-modes run,drun
```


### Rofi configuration {#rofi-configuration}

```cfg
@theme "/usr/share/rofi/themes/Arc-Dark.rasi"
configuration {
    modi: "window,run,ssh";
    timeout {
        action: "kb-cancel";
        delay:  0;
    }
    filebrowser {
        directories-first: true;
        sorting-method:    "name";
    }
}
```


## Clipboard {#clipboard}

[wl-clipboard](https://github.com/bugaevc/wl-clipboard) is a command line tool for copy/pasting text.

```sh
sudo pacman -S wl-clipboard
```

Now, text can be copied from CLI with `<some command> | wl-copy` or pasted from
clipboard with `wl-paste | <some command>`.

A clipboard is emptied when window is closed by default. To persist clipboard
after window closing use clipboard manager like [clipman](https://github.com/yory8/clipman).

```sh
sudo pacman -S clipman
```

Start with sway:

```cfg
exec wl-paste -t text --watch clipman store --no-persist
```


## Touch pad {#touch-pad}

Enable tap and natural scroll.

```cfg
input type:touchpad {
    tap enabled
    natural_scroll enabled
}
```


## Keyboards layouts {#keyboards-layouts}

```cfg
input * {
  xkb_layout "us,rs,rs"
  xkb_variant ",latin,"
  xkb_options "grp:shifts_toggle"
}
```


## Red shift {#red-shift}

Install [gammastep](https://gitlab.com/chinstrap/gammastep)

```sh
sudo pacman -S gammastep
```

Execute it from sway config with your long/lat:

```cfg
exec_always gammastep -l 45.26:19.83
```

There is also a tray indicator `gammastep-indicator`. I'm not using it.


## NetworkManager {#networkmanager}

Run applet with `--indictator` switch:

```cfg
exec_always nm-applet --indicator
```


## <span class="org-todo todo TODO">TODO</span> Bluetooth {#bluetooth}

Not working with sway. Will investigate.

```cfg
exec blueman-applet
```


## Wacom tablet {#wacom-tablet}

I use Wacom CTL-471 for screen annotation during lectures. [OpenTabletDriver](https://github.com/OpenTabletDriver/OpenTabletDriver) is a
user-mode cross-platform tablet driver with settings GUI.

Blacklist wacom kernel module:

```sh
sudo sh -c "echo 'blacklist wacom' > /etc/modprobe.d/nowacom.conf"
```

```sh
yay -S opentabletdriver
```

Start OTD from sway:

```cfg
exec otd
```

Run `otd-gui` for configuration.

Using [gromit-mpx](https://github.com/bk138/gromit-mpx/) for screen annotation.

There is a problem with capturing hotkeys. A workaround is to [handle hotkeys
through sway](https://github.com/bk138/gromit-mpx/issues/127#issuecomment-1211957811).

```cfg
mode "gromit-mpx" {
    # toggle painting
    bindsym f9 exec gromit-mpx --toggle
    # clear
    bindsym Shift+f9 exec gromit-mpx --clear
    # toggle visibility
    bindsym Ctrl+f9 exec gromit-mpx --visibility
    # quit
    bindsym Alt+f9 exec gromit-mpx --quit
    # undo
    bindsym f8 exec gromit-mpx --undo
    # redo
    bindsym Shift+f8 exec gromit-mpx --redo

    # Return to default mode
    bindsym $mod+g mode "default"
}
bindsym $mod+g mode "gromit-mpx"
```

Gromit-MPX use Xwayland. So to find the name of the device use:

```sh
xinput --list
```

Gromit-MPX config with red and green pen and eraser:

```cfg
"red Pen" = PEN (size=7 color="red");
"green Pen" = "red Pen" (color="green");

"Eraser" = ERASER (size = 75);

"Virtual core pointer" = "red Pen";
"Virtual core pointer"[Button2] = "green Pen";
"Virtual core pointer"[Button3] = "Eraser";
```

```ini
[General]
ShowIntroOnStartup=false

[Drawing]
Opacity=0.75
```


## Notification daemon {#notification-daemon}

Using swaync.

```sh
sudo yay -S swaync
```

Start with sway.

```cfg
exec_always swaync
```

Show pannel.

```cfg
bindsym $mod+grave exec swaync-client -t
```

Toggle Do-Not-Disturb mode.

```cfg
bindsym $mod+p exec swaync-client -d
```

Close all notifications:

```cfg
bindsym $mod+c exec swaync-client -C
```

See also the waybar configuration above.


## Warning on battery critical level {#warning-on-battery-critical-level}

Check battery, notify when low and suspend when critical.
Taken and adapted from [ArchLinux wiki](https://wiki.archlinux.org/index.php/Laptop#Hibernate_on_low_battery_level).

```sh
acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
    read -r status capacity

    if [ "$status" = Discharging ]; then
           if [ "$capacity" -lt 5 ]; then
               systemctl suspend
           elif [ "$capacity" -lt 15 ]; then
               notify-send -u critical "Battery low" "Current capacity is (${capacity}%)."
           fi
    fi
}
```

Create crontab entry with command `crontab -e` which call check script at 5 minute
interval.

```cron
*/5  * * * *  XDG_RUNTIME_DIR=/run/user/$(id -u) $HOME/.config/sway/check_battery.sh
```


## Autostart apps {#autostart-apps}

```cfg
exec {
  swaymsg 'workspace 1:editor; exec emacs'
  swaymsg 'workspace 2:browser; exec firefox'
}
```
