if status is-login
end

if status is-interactive
end

# set -U fish_greeting
set -gx EDITOR 'nvim'

fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

abbr --add x 'startx'
abbr --add r 'ranger'
abbr --add z 'zathura'
abbr --add l 'ls -lah'
abbr --add bg 'sh ~/dotfiles/etc/.fehbg'
abbr --add dft 'git difftool --no-symlinks --dir-diff'
abbr --add sus 'systemctl suspend'
abbr --add bak 'rclone sync --verbose --skip-links ~/Documents ewesoff-g-drive:framework/Documents'
abbr --add lok 'xset s activate'
abbr --add safe 'mkdir -p /dev/shm/Safe.mount && gocryptfs ~/Documents/Safe.cipher/ /dev/shm/Safe.mount'
abbr --add umsafe 'fusermount -u /dev/shm/Safe.mount && rmdir /dev/shm/Safe.mount'
abbr --add fishc 'nvim ~/dotfiles/.config/fish/config.fish'
abbr --add nvimc 'cd ~/dotfiles/.config/nvim && nvim init.lua && cd ~'
abbr --add notes 'nvim ~/Documents/UNLV/2023/Fall/Fall\ 2023\ Class\ Notes.md'
abbr --add intellij '~/Applications/idea-IC-232.9559.62/bin/idea.sh'
abbr --add gnome 'XDG_SESSION_TYPE=wayland dbus-run-session gnome-session'
abbr --add bsp 'XINITRC=~/dotfiles/etc/.bspwm-xinitrc startx'

source ~/.secrets
source /opt/asdf-vm/asdf.fish
