# Arch Linux Notes

* NOTE! running this command because yay broke after updates:

```
sudo ln -s /usr/lib/libalpm.so.14.0.0 /usr/lib/libalpm.so.13
```

taken from:

https://www.reddit.com/r/EndeavourOS/comments/1be08gg/yay_paru_broken_cant_do_anything_with_them_even/

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

To enable/disable a device, i.e. wifi card:

`nmcli radio wifi [on|off]`

To show the password of a known wifi network:

`nmcli --show-secrets connection show TeamBanana3.0 | grep psk`

P.S.:

`nmtui` exists as a ncurses based UI! just for adding and
editing connections.

### Change time and timezone

* `timedatectl set-time [yyyy-mm-dd HH:MM:SS]`
* `timedatectl list-timezones`
* `timedatectl set-timezone [timezone]`
** timezone -> ex. Europe/Berlin, America/Los_Angeles

#### Sync system clock (user, local) to hardware clock (BIOS/UEFI)

* `sudo hwclock --systohc`

### Color temperature

#### Don't use xflux, it's super buggy

#### redshift

Set a one-time temperature:

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

### Mounting a drive

Use `sudo mount /dev/[partition] [mount_point]`

However, if you want the drive to show up in the sidebar in
file managers like dolphin, thunar, etc., use:

```
sudo mount /dev/partition /run/media/elliot/[mount_point] --mkdir -o umask=0
```

### Formatting a drive

1. switch to root user
2. use `lsblk` to identify the device number
3. use `fdisk <dev>`, NOT parted! ex. `fdisk /dev/sdb`
4. use fdisk commands to reformat the drive and its partitions
5. create the filesystem using `mkfs.[fs-type] /dev/sdb[num]`
6. victory!

### Bluetooth

Use the `blueman` package. Start the applet with `blueman-applet`
before running `blueman-manager`.

### Shell hacks

You can concatenate multiple files together in memory and
pipe/redirect them to another program via stdin:

`some_program < <(cat file1 file2 file3)`

### Syncing music


1. Mount the partition to `/run/media` with: `sudo mount /dev/[partition] /run/media --mkdir -o umask=0`
  i. For some reason, root is still required to add/remove files on
  the drive :[
2. Run the script `~/dotfiles/scripts/sync-flac.fish`
  i. The script runs in "dry run" mode by default.
3. Comment out the `--dry-run` flag after inspecing `rsync` output.
4. Run `sudo ~/dotfiles/scripts/sync-flac.fish`

## Dev

### ruby

To make a virtual environment similar to python's venv, tell bundler
to use a local folder, like vendor/bundle:

`bundle config set --local path 'vendor/bundle'`

Then install the gems:

`bundle install`

Then run the program using the gems installed in vendor/bundle:

`bundle exec ruby [program.rb]`

* you may or may not need these lines at the top of your program's
  entry point:

  ```
  require 'bundler/setup'
  Bundler.require
  ```

## Applications

### (n)vim

#### Multi-line edit

1. Press ctrl + v (for visual block and not visual line)
2. Make your edits
3. Press escape

* note: does not work for insert mode. use the method below.

Or use a `normal` command:

`:10,20 normal I* `

This inserts a `* ` at the beginning of lines 10-20.

#### Search and replace with regex

Let's say you have the example text:

```
apply_test1_config
apply_test2_config
apply_test3_config
```

And you wanted to quickly remove the apply_ and _config on both sides
of each line. The following search and replace command:

```
:%s/apply_\(\w\+\)_config/\1
```

Would transform the text to:

```
test1
test2
test3
```

#### python development

For all python projects, first create a virtual environment:

`python -m venv .`

Then install stuff:

`bin/pip install whatever`

nvim isn't going to be able to find those packages in the virtual
environment, since it only knows to look in the global python package
cache. Tell pyright to look in your current venv:

`:PyrightSetPythonPath [path/to/venv/bin/python]`

### xxd (hex editing)

The command line tool `xxd` is available by default in nvim. To
convert a file to hex:

Convert a file to hex: `:%!xxd`

Convert it back: `:%!xxd -r`


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
* `n/p - next/previous image`

Open multiple images (ex.): `sxiv *.jpg`

### ranger

Sorting: `o` (order)

* `oc` - order by creation time
* `on` - order "natural" (default sorting)
* `oN` - order reverse "natural"

Filtering* by tag:

* use `"[tag_letter]` to create any kind of tag letter on a file
* `:mark_tag [tag_letter]` to select all files with that tag
* `:narrow` to filter out files not selected
* Ctrl-R to reset the view when done

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
convert -density [150? 600? idk but it's supposed to make it better] *.jpg output.pdf 
```

* NOTE: convert is bad at preserving pdf quality when concatenating
  pdfs. USE PDFTK!

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

### kitty

Kitty has some pretty sweet keybinds. Hold ctrl + shift [letter] to
get a pretty sweet kitty feature:

* `F1` - kitty help
* `t` - new tab
* `w` - close tab
* `h` - history
* `g` - last command output
* `=` - font size up
* `-` - font size down:wqa

### KDE

If the plasma taskbar disappears:

1. `pkill plasmashell`
2. `rm -rf .config/plasma-org.kde.plasma.desktop-appletsrc`
3. `plasmashell` or restart KDE

## System

### pam & gocryptfs

I *believe*
[this](https://github.com/rfjakob/gocryptfs/wiki/Mounting-on-login-using-pam_mount)
guide was used for setting up home folder encryption.

### Devices

* `/sys/class` contains information about all classes of devices
  known (connected?, detected?) to the system
* `/sys/class/drm` contains all of the various video "cards"
  detected on the system

### udev

Adding/modifying udev rules is a royal pain in the ass. If your
script doesn't run off the bat, it's hard to know if udev is actually
picking up your rule, it's error free, and that the commands are
being ran. Tips to debug:

* To trigger a udev "change" on block devices manually:

`sudo udevadm trigger --subsystem-match=block`

* udev rule changes should be reloaded/detected automatically, but
  you can reload them manually:

`sudo udevadm control --reload-rules`

* Errors within rules, such as syntax errors, bad substitution chars,
  etc. can be found in the journal:

`sudo journalctl -u systemd-udevd --no-pager --follow`

`journalctl -xe --follow`

* You can watch the actual events that are propogated by udev with:

`sudo udevadm monitor --kernel --property --subsystem-match=block`

* You can test udev rules with:

`udevadm test (udevadm info -q path -n /dev/sda)`

(the udevadm info command returns a device path)

On each of the above commands, remove the named arguments to see more
output/make the output less restrictive.


### ramfs and tmpfs

An in-memory filesystem is automatically made available by linux. It is
called tmpfs.

https://www.kernel.org/doc/html/latest/filesystems/tmpfs.html

tmpfs is always available at `/dev/shm`.

Alternatively, there is also ramfs:

https://wiki.debian.org/ramfs

The main difference between the two is:

* with ramfs, you must create the fs and mount it yourself
* ramfs will never swap, making it ideal for storing secrets

### Mounting a flash drive

Normally, you would use `mount [device] [mountpoint]`, but since
`mount` requires su privileges, you won't be able to modify anything
on the drive without using `sudo`. This mount command will allow any
user to modify files on the drive:

`mount -o gid=users,fmask=113,dmask=002 [device] [mountpoint]`

### File allocation

You can allocate a specified amount of space on disk with `fallocate`:

`sudo fallocate -l 5G /data/test1.img`

### Switching to another tty

The default tty (terminal) is set to tty1. Switch to another tty
using:

```
ctrl + alt + F[2-6]
```

### Keebs and flashing nonsense

When putting a keeb using QMK into bootloader (DFU) mode, it won't
mount automatically like on Windows or Mac. It *should* show up in a
GUI like Thunar, then clicking on it will mount it. Running the `qmk
flash` command will then flash the keymap to the keeb.

If, however, you don't want to use the GUI, the CLI commands are:

```
# 1. put the keeb into DFU mode (done on hardware)
# 2. verify the keeb is showing up as a block device with `lsblk`
(optional)
# 3. mount the keeb to the removable media section of the file
system:
    
    $ sudo mount /dev/sda1 /run/media/elliot/RPI-RP2 --mkdir -o umask=0

# 4. run the qmk flash command:

    $ qmk flash -kb keebio/sinc/rev4 -km elliot

    the flash command should (hopefully) return successfully,
    indicating the keymap was successfully flashed to the keeb.

# 5. unmount the folder created by mount:

    $ sudo umount -f /run/media/elliot/RPI-RP2

# 6. remove the mount folder: 

    $ sudo rmdir /run/media/elliot/RPI-RP2
```
