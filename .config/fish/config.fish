if status is-login
end

if status is-interactive
end

set -U fish_greeting
set -gx EDITOR 'nvim'

fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

abbr --add x 'startx'
abbr --add r 'ranger'
abbr --add z 'zathura'
abbr --add l 'ls -lah'
abbr --add dft 'git difftool --no-symlinks --dir-diff'
abbr --add nvimc 'cd ~/dotfiles/.config/nvim && nvim init.lua && cd ~'
abbr --add sus 'systemctl suspend'
abbr --add intellij '~/Applications/idea-IC-232.9559.62/bin/idea.sh'
abbr --add notes 'nvim ~/Documents/UNLV/2023/Fall/Fall\ 2023\ Class\ Notes.md'

source ~/.secrets
source /opt/asdf-vm/asdf.fish
