---
title: Slow Libre Office file opening
---

If you are experiencing a several seconds delay while opening files with Libre Office (Open Office might be affected to) it might be the same issue I run into today.

It seems that during startup LO polls printers over [CUPS daemon](https://wiki.archlinux.org/index.php/CUPS). If there is a problem with the network and configured printers are not reachable you will experience a several seconds delay with each file open.  This will not affect opening a file in the already running instance of LO.

The current workaround I use is to disable CUPS

    sudo systemctl stop org.cups.cupsd
    sudo systemctl disable org.cups.cupsd

... and start it only when I plan to do some printing and the printers are reachable:

    sudo systemctl start org.cups.cupsd



