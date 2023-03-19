if status is-login
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting
abbr --add l 'ls -lah'
abbr --add dft 'git difftool --no-symlinks --dir-diff'
abbr --add x 'startx'
