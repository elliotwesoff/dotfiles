if status is-login
end

if status is-interactive
end

set -U fish_greeting
set -gx EDITOR 'nvim'

fish_add_path ~/.local/share/gem/ruby/3.0.0/bin
fish_add_path ~/.local/share/gem/ruby/3.1.0/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

abbr --add x 'startx'
abbr --add l 'ls -lah'
abbr --add dft 'git difftool --no-symlinks --dir-diff'
abbr --add nvimc 'cd ~/dotfiles/.config/nvim && nvim init.lua && cd ~'
abbr --add r 'ranger'

source ~/.secrets

eval "$(rbenv init - 2> /dev/null)"

# node version manager initialization
# source /usr/share/nvm/init-nvm.sh 2> /dev/null
