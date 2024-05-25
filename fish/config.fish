if status is-interactive
and not set -q TMUX
    exec tmux -u
end

alias notes='nvim "+Neorg workspace notes"'

starship init fish | source

set os $(uname -a | awk '{print $2}')
if test $os = "nixos"
    function __fish_command_not_found_handler --on-event fish_command_not_found
      command-not-found $argv
    end
end
