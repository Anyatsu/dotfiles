{ pkgs, ... }:
{
  home.packages =
    let
      tmux = "${pkgs.tmux}/bin/tmux";
    in
    [
      (pkgs.writeShellScriptBin "edit-tmux-output" ''
        file=`mktemp`.sh
        ${tmux} capture-pane -pS -32768 > $file
        ${tmux} new-window -n:mywindow "$EDITOR '+ normal G $' $file"
      '')
    ];
}
