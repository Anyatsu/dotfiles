{ pkgs, ... }:
{
#  xdg.desktopEntries = {
   # "lf" = {
#      name = "lf";
#      noDisplay = true;
#    };
#  };

  home.packages = with pkgs; with gnome; [
    # gui
    d-spy
    gimp
    discord
    vesktop
    icon-library

    # tools
    bat
    eza
    gcc
    ripgrep
    fd
    ripgrep
    fzf
    libnotify
    killall
    zip
    unzip
    glib

    # programming
    rustc
    cargo
    nodejs
  ];

  programs = {
    neovim.enable = true;
  };

}
