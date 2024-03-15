{ pkgs, config, ... }:
{
  #  xdg.desktopEntries = {
  # "lf" = {
  #      name = "lf";
  #      noDisplay = true;
  #    };
  #  };

  home.packages =
    with pkgs;
    with gnome;
    [
      # gui
      d-spy
      gamescope
      gimp
      discord
      vesktop
      xwaylandvideobridge
      icon-library

      # tools
      yazi
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
      nixfmt-rfc-style
    ];

  programs = {
    neovim.enable = true;
  };
}
