{
  pkgs,
  config,
  inputs,
  ...
}:
{
  home.packages =
    let
      aagl-gtk-on-nix = import (
        builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz"
      );
    in
    [
      aagl-gtk-on-nix.sleepy-launcher
    ];
}
