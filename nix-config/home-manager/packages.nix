{
  pkgs,
  config,
  inputs,
  ...
}:
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
      alacritty
      redshift

      gxmatcheq-lv2
      gimp
      discord
      vesktop
      webcord
      # xwaylandvideobridge
      icon-library
      mpv
      obs-studio
      x42-avldrums
      protonvpn-gui
      networkmanagerapplet
      bottles
      lutris
      geckodriver
      zrythm
      quickemu
      heroic
      fsearch

      protonup-ng
      protontricks
      gamemode
      dxvk

      syncthing
      obsidian

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
      starship
      joystickwake

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
