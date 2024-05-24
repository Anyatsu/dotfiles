if status is-interactive
and not set -q TMUX
    exec tmux -u
end

alias notes='nvim "+Neorg workspace notes"'

starship init fish | source
