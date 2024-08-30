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
      qdirstat

      foot
      alacritty
      redshift

      gxmatcheq-lv2
      gimp
      discord
      vesktop
      webcord
      icon-library
      mpv
      x42-avldrums
      protonvpn-gui
      networkmanagerapplet
      bottles
      lutris
      geckodriver
      zrythm
      heroic
      fsearch
      transmission_4-gtk

      godot_4
      blender
      krita
      aseprite
      unityhub

      protonup-ng
      protontricks

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
      p7zip
      glib
      tmux
      starship

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
