+++
title = "Guix tips and tricks"
lastmod = 2023-01-04T21:08:03+01:00
rtags = ["guix", "linux"]
draft = false
creator = "Emacs 28.2 (Org mode 9.6 + ox-hugo)"
+++

## Useful [Guix](https://guix.gnu.org/) commands {#useful-guix-commands}

| subcommand (guix ...)                       | description                                   |
|---------------------------------------------|-----------------------------------------------|
| `describe --format=channel`                 | Decribe channels in Guile format              |
| `search <what>`                             | Search packages                               |
| `install <packages>`                        | Install packages and make a new generation    |
| `package --list-installed (or -I)`          | List installed packages                       |
| `package -A`                                | List available packages                       |
| `package -A wlr`                            | List available containing given word in name  |
| add `--profile=<path>` to previous commands | List installed packages from given profile    |
| `package --roll-back`                       | Roll-back to previous generation              |
| `package --list-generations`                | List generations                              |
| `package --switch-generation <>`            | Switch to given generation by number          |
| `size <package>`                            | Report size of package and its deps           |
| `graph -M 2 <package>`                      | Produce `dot` graph of deps with depth 2      |
|                                             | ..pipe to `xdot -` to visualize               |
| `weather <package>`                         | Check if package is available as a substitute |
| `pull`                                      | Update channels                               |

-   List system level packages (works only of a full Guix system):
    ```sh
        guix packages --list-installed --profile=/run/current-system/profile
    ```


## Additional channels {#additional-channels}

In `~/.config/guix/channels.scm`:

```scheme
(cons*
 (channel
  (name 'nonguix)
  (url "https://gitlab.com/nonguix/nonguix")
  (introduction
   (make-channel-introduction
    "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
    (openpgp-fingerprint
     "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
 (channel
  (name 'guix-gaming-games)
  (url "https://gitlab.com/guix-gaming-channels/games.git")
  (introduction
   (make-channel-introduction
    "c23d64f1b8cc086659f8781b27ab6c7314c5cca5"
    (openpgp-fingerprint
     "50F3 3E2E 5B0C 3D90 0424  ABE8 9BDC F497 A4BB CC7F"))))

 %default-channels)
```


## Run Guix in VM {#run-guix-in-vm}

```sh
wget https://ftp.gnu.org/gnu/guix/guix-system-vm-image-1.4.0.x86_64-linux.qcow2
qemu-system-x86_64 \
   -nic user,model=virtio-net-pci \
   -enable-kvm -m 2048 \
   -device virtio-blk,drive=myhd \
   -drive if=none,file=guix-system-vm-image-1.4.0.x86_64-linux.qcow2,id=myhd
```


## Install Guix in VM {#install-guix-in-vm}

```sh
wget https://ftp.gnu.org/gnu/guix/guix-system-install-1.4.0.x86_64-linux.iso
wget https://ftp.gnu.org/gnu/guix/guix-system-install-1.4.0.x86_64-linux.iso.sig
gpg --verify guix-system-install-1.4.0.x86_64-linux.iso.sig
# Ako nemam GPG javni ključ
wget https://sv.gnu.org/people/viewgpg.php?user_id=15145 -qO - | gpg --import -

# Copy on a USB stick
dd if=guix-system-install-1.4.0.x86_64-linux.iso of=/dev/sdX status=progress
sync

# Run in VM
qemu-img create -f qcow2 guix-system-igord.qcow2 50G
qemu-system-x86_64 -m 1024 -smp 1 -enable-kvm \
  -nic user,model=virtio-net-pci -boot menu=on,order=d \
  -drive file=guix-system-igord.qcow2 \
  -drive media=cdrom,file=guix-system-install-1.4.0.x86_64-linux.iso
```

-   Follow installation instructions.
-   After the installation is complete run the image in VM as described in a
    previous node.
    ```sh
          qemu-system-x86_64 -m 1024 -smp 1 -enable-kvm \
          -nic user,model=virtio-net-pci -boot menu=on,order=d \
          -drive file=guix-system-igord.qcow2
    ```
-   System config is in `/etc/config.scm`. To change configuration run:
    ```sh
      guix pull
      sudo guix system reconfigure /etc/config.scm
    ```

See the manual.


## Mount local folder inside QEMU {#mount-local-folder-inside-qemu}

```sh
qemu-system-x86_64 -m 2048 -smp 1 -enable-kvm \
-nic user,model=virtio-net-pci -boot menu=on,order=d \
-drive file=guix-system-igord.qcow2 -virtfs local,path=/home/igor/repos/config/guix/,security_model=passthrough,mount_tag=host0,id=host0
```

-   Inside the guest:
    ```sh
          mkdir config
          sudo mount -t 9p -o trans=virtio,version=9p2000.L host0 ~/config
    ```


## Running Guix Shell {#running-guix-shell}

```sh
guix shell --container python coreutils procps grep less util-linux bash -- bash
```

-   or simply:
    ```sh
          guix shell -e '(@ (gnu) %base-packages)'
    ```
-   or with isolation just to the current folder:
    ```sh
          guix shell --container -e '(@ (gnu) %base-packages)'
    ```


## Interesting install config with non-free stuff {#interesting-install-config-with-non-free-stuff}

-   [On reddit](https://www.reddit.com/r/GUIX/comments/epckio/gnu_system_with_wayland_and_sway/)


## Configure new system inside QEMU from Arch {#configure-new-system-inside-qemu-from-arch}

-   Configuration in `~/repos/config/guix`.
-   [Mount the folder](#mount-local-folder-inside-qemu) inside QEMU and run the image.
-   Reconfigure with `sudo guix system reconfigure ~/config/system.scm`


## Copy paste with QEMU {#copy-paste-with-qemu}

-   For this [SPICE](https://spice-space.org/) is used. See [this tutorial](https://www.linux-kvm.org/page/SPICE).
-   But it looks like it wont work with sway.


## Use sway/wayland inside QEMU {#use-sway-wayland-inside-qemu}

-   [Interesting try](https://ask.fedoraproject.org/t/run-sway-in-qemu/23753). It kinda works.
    ```sh
          qemu-system-x86_64 \
          -m 2G -smp 1 -enable-kvm \
          -nic user,model=virtio-net-pci \
          -boot menu=on,order=d \
          -drive file=guix-system-igord.qcow2 \
          -virtfs local,path=/home/igor/repos/config/,security_model=passthrough,mount_tag=host0,id=host0 \
          -device intel-hda \
          -device hda-duplex \
          -device virtio-vga-gl \
          -display gtk,gl=on
    ```
