# Elliot's arch notes!

## Adding a printer

* use `system-config-printer` in terminal to add a printer.

## Connect to wifi

1. `nmcli d wifi list`
2. `nmcli d wifi connect [SSID] password [password]`

To disconnect:

`nmcli con down [network name]`

To enable/disable a device:

`nmcli radio wifi [on|off]`

## Change time and timezone

* `timedatectl set-time [yyyy-mm-dd HH:MM:SS]`
* `timedatectl set-timezone [timezone]`
** timezone -> Europe/Berlin or America/Los_Angeles

### Sync system clock (user, local) to hardware clock (BIOS/UEFI)

* `sudo hwclock --systohc`

## Color temperature

* using xflux (aur), set commands in .xinitrc
* `xflux -z 91016 &` # => los angeles
* `xflux -l 48 -g 11 &` # => munich

## CPU Underclocking

* `sudo cpupower frequency-set -u 800MHz`
* `sudo cpupower frequency-info`
* GUI version is cpupower-gui

## Install a package from an archive file

* `sudo pacman -U <archive filename>`

## Formatting a drive

1. switch to root user
2. use `lsblk` to identify the device number
3. use `fdisk <dev>`, NOT parted! ex. `fdisk /dev/sdb`
4. use fdisk commands to reformat the drive and its partitions
5. create the filesystem using `mkfs.[fs-type] /dev/sdb[num]`
6. victory!

## feh

View all images in a folder:

`feh *`

Use the following options, it will make your life easier:

`feh --auto-rotate --auto-zoom --keep-zoom-vp --preload
--recursive *`

Shorter easier version:

`feh --auto-rotate -Z --keep-zoom-vp -p -r *.jpg`

* Up/down increases/decreases zoom
* Left/right shows previous/next image
* < rotates CCW, > rotates CW
* https://man.finalrewind.org/1/feh/

Keybinds:
* k [toggle_keep_vp]
* ! key makes the image fit the current window size (fit by
  height?)
* / key makes the image fit the current window size, but
  different (fit by width?)
* _ vertical flip
* | horizontal flip
* o toggle pointer
* m toggle menu
* i toggle info display
* d toggle filenames

