set -gx PATH $fish_user_paths /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin

set_coordinates

abbr --add a 'source bin/activate.fish'
abbr --add x 'startx'
abbr --add r 'ranger'
abbr --add z 'zathura'
abbr --add l 'ls -lah'
abbr --add v 'nvim'
abbr --add dft 'git difftool --no-symlinks --dir-diff'
abbr --add sus 'systemctl suspend'
abbr --add bak 'rclone sync --verbose --skip-links ~/Documents ewesoff-g-drive:framework/Documents'
abbr --add fishc 'nvim ~/dotfiles/.config/fish/config.fish'
abbr --add nvimc 'nvim --cmd \'cd ~/dotfiles/.config/nvim\' ~/dotfiles/.config/nvim/init.lua'
abbr --add kittyc 'nvim ~/dotfiles/.config/kitty/kitty.conf'
abbr --add alacrittyc 'nvim ~/dotfiles/.config/alacritty/alacritty.toml'
abbr --add safe 'mkdir -m 700 -p /dev/shm/Safe.mount && gocryptfs ~/Documents/Safe.cipher/ /dev/shm/Safe.mount'
abbr --add umsafe 'fusermount -u /dev/shm/Safe.mount && rmdir /dev/shm/Safe.mount'
abbr --add diary 'nvim ~/secret.mount/diaries/diary.md'
abbr --add yolo 'git push heroku main'
