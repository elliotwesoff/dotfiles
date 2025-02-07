if status is-login
end

if status is-interactive
end

# set -U fish_greeting
set -gx EDITOR 'nvim'

fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

# android studio shiz
set --export ANDROID_HOME /home/elliot/.android/SDK
# fish_add_path $ANDROID_HOME/emulator
# fish_add_path $ANDROID_HOME/platform-tools

set --universal nvm_default_version 18.19.1

if test (timedatectl show --property=Timezone) = "Timezone=Europe/Berlin"
    # munich
    set -x LOC_LAT 48.14803580815556
    set -x LOC_LONG 11.588875333597782
else
    # surf beach
    set -x LOC_LAT 34.6831139
    set -x LOC_LONG -120.6232676
end

abbr --add x 'startx'
abbr --add r 'ranger'
abbr --add z 'zathura'
abbr --add l 'ls -lah'
abbr --add bg 'sh ~/dotfiles/.fehbg'
abbr --add gp 'git push'
abbr --add dft 'git difftool --no-symlinks --dir-diff'
abbr --add sus 'systemctl suspend'
abbr --add bak 'rclone sync --verbose --skip-links ~/Documents ewesoff-g-drive:framework/Documents'
abbr --add lok 'xset s activate'
abbr --add safe 'mkdir -m 700 -p /dev/shm/Safe.mount && gocryptfs ~/Documents/Safe.cipher/ /dev/shm/Safe.mount'
abbr --add umsafe 'fusermount -u /dev/shm/Safe.mount && rmdir /dev/shm/Safe.mount'
abbr --add fishc 'nvim ~/dotfiles/.config/fish/config.fish'
abbr --add nvimc 'cd ~/dotfiles/.config/nvim && nvim init.lua && cd ~'
abbr --add kittyc 'nvim ~/dotfiles/.config/kitty/kitty.conf'
abbr --add alacrittyc 'nvim ~/dotfiles/.config/alacritty/alacritty.toml'
abbr --add diary 'nvim /dev/shm/Safe.mount/etc/secret/diaries/diary.md'
abbr --add bsp 'XINITRC=~/dotfiles/.bspwm-xinitrc startx'
abbr --add berrywm 'XINITRC=~/dotfiles/.berrywm-xinitrc startx'
abbr --add plasmax 'XINITRC=~/dotfiles/.plasma-xinitrc startx'
abbr --add plasmaw '/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland'
abbr --add cosmic 'start-cosmic'
abbr --add yolo 'git push heroku main'

source ~/.secrets
# source /opt/asdf-vm/asdf.fish

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
