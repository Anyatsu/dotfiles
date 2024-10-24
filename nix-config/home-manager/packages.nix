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

      gimp
      discord
      vesktop
      webcord
      icon-library
      mpv
      protonvpn-gui
      networkmanagerapplet
      bottles
      lutris
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
      deja-dup
      obsidian

      # tools
      yazi
      python312Packages.gpustat
      gcc
      ripgrep
      fd
      fzf
      libnotify
      killall
      zip
      unzip
      p7zip
      unar
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
