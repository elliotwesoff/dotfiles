# ~/.config/fish/config.fish

# manually set PATH to remove perl and other entries that shouldn't be there
set -gx PATH $fish_user_paths /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin

set_coordinates

abbr --add a 'source bin/activate.fish'
abbr --add x 'startx'
abbr --add r 'ranger'
abbr --add z 'zathura'
abbr --add l 'ls -lah'
abbr --add m 'sudo mount -o uid=elliot,gid=elliot,fmask=133,dmask=022 # this is for [ex]FAT filesystems only!'
abbr --add dft 'git difftool --no-symlinks --dir-diff'
abbr --add sus 'systemctl suspend'
abbr --add pow 'systemctl poweroff'
abbr --add bak 'rclone sync --verbose --skip-links ~/Documents ewesoff-g-drive:framework/Documents'
abbr --add fishc 'nvim ~/.config/fish/config.fish'
abbr --add nvimc 'nvim --cmd \'cd ~/.config/nvim\' ~/.config/nvim/init.lua'
abbr --add kittyc 'nvim ~/.config/kitty/kitty.conf'
abbr --add alacrittyc 'nvim ~/.config/alacritty/alacritty.toml'
abbr --add safe 'mkdir -m 700 -p /dev/shm/Safe.mount && gocryptfs ~/Documents/Safe.cipher/ /dev/shm/Safe.mount'
abbr --add umsafe 'fusermount -u /dev/shm/Safe.mount && rmdir /dev/shm/Safe.mount'
abbr --add diary 'nvim ~/secret.mount/diaries/diary.md'
abbr --add yolo 'git push heroku main'
