if status is-login
end

if status is-interactive
end

set -U fish_greeting
set -gx EDITOR 'nvim'

fish_add_path ~/.local/share/gem/ruby/3.1.0
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

abbr --add x 'startx'
abbr --add l 'ls -lah'
abbr --add dft 'git difftool --no-symlinks --dir-diff'
abbr --add nvimc 'cd ~/dotfiles/.config/nvim && nvim init.lua && cd ~'
abbr --add rgr 'ranger'
abbr --add r 'ranger'

# TODO: how to translate these to fish?
# source ~/.secrets
#
# # node version manager initialization
# source /usr/share/nvm/init-nvm.sh 2> /dev/null
#
# # rbenv init
# eval "$(rbenv init - 2> /dev/null)" 
# if [[ $(which nvim) =~ nvim ]]
# then
#   export EDITOR='nvim'
# else
#   export EDITOR='vim'
# fi

