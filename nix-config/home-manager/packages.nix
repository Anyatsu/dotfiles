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
      qdirstat
      foot
      gamescope
      gimp
      discord
      vesktop
      xwaylandvideobridge
      icon-library
      mpv

      # tools
      yazi
      python312Packages.gpustat
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
      tmux

      # programming
      rustc
      python3
      cargo
      nodejs
      nixfmt-rfc-style
      ventoy
    ];

  programs = {
    neovim.enable = true;
  };
}
