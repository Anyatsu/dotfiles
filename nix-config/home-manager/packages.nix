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
    fd
    ripgrep
    fzf
    libnotify
    killall
    zip
    unzip
    glib

    # fun
    wine-staging
    winetricks

    # music
    yabridge
    yabridgectl

    lsp-plugins
    guitarix
    gxplugins-lv2
    vital

    reaper

    # programming
    rustc
    cargo
    nodejs
  ];

  programs = {
    neovim.enable = true;
  };

}
