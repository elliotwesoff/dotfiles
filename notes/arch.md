# Elliot's arch notes!

## Maintenance/general tasks and usage

### Adding a printer

use `system-config-printer` in terminal to add a printer.

but really print from another computer or phone, if possible.
adding a printer is fucking agonizing.

### Connect to wifi

1. `nmcli d wifi list`
2. `nmcli d wifi connect [SSID] password [password]`

To disconnect:

`nmcli con down [network name]`

To enable/disable a device:

`nmcli radio wifi [on|off]`

To show the password of a known wifi network:

`nmcli --show-secrets connection show TeamBanana3.0 | grep psk`

P.S.:

`nmtui` exists as a ncurses based UI! just for adding and
editing connections.

### Change time and timezone

* `timedatectl set-time [yyyy-mm-dd HH:MM:SS]`
* `timedatectl set-timezone [timezone]`
** timezone -> Europe/Berlin or America/Los_Angeles

#### Sync system clock (user, local) to hardware clock (BIOS/UEFI)

* `sudo hwclock --systohc`

### Color temperature

#### HEY! don't use xflux, it's super buggy

* using xflux (aur), set commands in .xinitrc
* `xflux -z 91016 &` # => los angeles
* `xflux -l 48 -g 11 &` # => munich

~~redshift is supposed to work well, but it wouldn't work on my pc
for whatever reason.~~

`redshift` seems to work now, so to set a one-time temperature:

```
redshift -P -O [temp]
```

To run as a background task (e.g. from `.xinitrc`):

```
redshift -P -l [lat]:[long] -t [day temp]:[night temp] &
```

### CPU Underclocking

* `sudo cpupower frequency-set -u 800MHz`
* `sudo cpupower frequency-info`
* GUI version is cpupower-gui

### Install a package from an archive file

* `sudo pacman -U <archive filename>`

how to find the archive filename?

### Formatting a drive

1. switch to root user
2. use `lsblk` to identify the device number
3. use `fdisk <dev>`, NOT parted! ex. `fdisk /dev/sdb`
4. use fdisk commands to reformat the drive and its partitions
5. create the filesystem using `mkfs.[fs-type] /dev/sdb[num]`
6. victory!

## Applications

### (n)vim

To perform a multiline edit:

1. Press ctrl + v (for visual block and not visual line)
2. Make your edits
3. Press escape

Or use a `normal` command:

`:10,20 normal I* `

This inserts a `* ` at the beginning of lines 10-20.

### feh

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

### sxiv

* `f - fullscreen`
* `b - infobar`
* `= - zoom to 100%`
* `W - fit`
* `e - fit to window width`
* `E - fit to window height`

### ranger

Sorting: `o` (order)

* `oc` - order by creation time
* `on` - order "natural" (default sorting)
* `oN` - order reverse "natural"

### gpg

To encrypt a file (assuming you already have your own pair of GPG
keys generated and installed on your machine):

```
gpg --encrypt --output {output_filename} --recipient {email
address associated with the GPG key of the recipient. this must
also be present on your machine. idk how gpg links it. you just
have to add it somehow. do a google ffs.} {filename}
```

After encrypting a file, be sure to remove the original filename.
If you use a .gpg extension on top of the original filename, then
it should be obvious which file to remove. Don't be a dumb idiot
and overwrite the original file with the encrypted file. Don't be
a dumb idiot and remove the original file!!!

To decrypt a file encrypted with gpg:

```
gpg --decrypt --output {output_filename} {input_filename
(probably has a .gpg extension)}
```

### pdftk

To combine pdf files that contain *text*, use pdftk:

```
pdftk *.pdf cat output file.pdf
```

or, without a glob:

```
pdftk 1.pdf 2.pdf 3.pdf cat output file.pdf
```

To combine images into a pdf, use imagemagick's convert:

```
convert -density [150? 600? idk but it's supposed to make it
better] *.jpg output.pdf 
```

### rclone

Use this command to back up your documents folder to google drive
after you've already configured rclone:

```
rclone sync --progress ~/Documents ewesoff-google-drive:X1/Documents
```

(rough) contents of rclone.conf:

```
[ewesoff-google-drive]
type = drive
client_id = <client id here>
client_secret = <client secret here>
scope = drive.file
service_account_file = 
team_drive = 
token = {"access_token":"<token>","token_type":"Bearer","refresh_token":"<refresh token>","expiry":"2023-05-07T12:58:51.99556164-07:00"}
```

I don't remember where to get the token from, but it's likely
from Google's apps API platform thing. RClone's docs should tell
you how to get it.

### foliate

Use foliate for epub files. The zathura-mupdf extension works but
the rendering is weird.

## System

### Devices

* `/sys/class` contains information about all classes of devices
  known (connected?, detected?) to the system
* `/sys/class/drm` contains all of the various video "cards"
  detected on the system






















