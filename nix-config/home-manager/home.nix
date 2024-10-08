{
  config,
  pkgs,
  inputs,
  outputs,
  lib,
  ...
}:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "yuval";
  home.homeDirectory = "/home/yuval";
  # home-manager.backupFileExtension = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];

    config = {
      allowUnfree = true;
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    (pkgs.writeShellScriptBin "command-not-found" ''
      #!${pkgs.bash}/bin/bash
      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
      command_not_found_handle "$@"
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables =
    let
      makePluginPath =
        format:
        (lib.makeSearchPath format [
          "$HOME/.nix-profile/lib"
          "/run/current-system/sw/lib"
          "/etc/profiles/per-user/$USER/lib"
        ])
        + ":$HOME/.${format}";
    in
    {
      DSSI_PATH = makePluginPath "dssi";
      LADSPA_PATH = makePluginPath "ladspa";
      LV2_PATH = makePluginPath "lv2";
      LXVST_PATH = makePluginPath "lxvst";
      VST_PATH = makePluginPath "vst";
      VST3_PATH = makePluginPath "vst3";

      # WLR_NO_HARDWARE_CURSORS = "1";
      # WLR_DRM_NO_ATOMIC = 1; # Remove when kernel version is >= 6.8
      __GL_MaxFramesAllowed = 1;
      # GDK_BACKEND = "wayland,x11";
      # QT_QPA_PLATFORM = "wayland;xcb";
      #SDL_VIDEODRIVER = "x11";
      # CLUTTER_BACKEND = "wayland";
      # XDG_CURRENT_DESKTOP = "Hyprland";
      # XDG_SESSION_TYPE = "wayland";
      # XDG_SESSION_DESKTOP = "Hyprland";
      DXVK_CONFIG_FILE = "/home/yuval/Projects/test/dxvk.conf";
    };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./tmux.nix
    ./theme.nix
    ./ags.nix
    ./git.nix
    # ./hyprland.nix
    ./packages.nix
    ./music-production.nix
  ];

  programs.firefox = {
    enable = true;
    profiles.yuval.extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
      ublock-origin
      bitwarden
      sponsorblock
    ];
  };

  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "pnmaklegiibbioifkmfkgpfnmdehdfan"; } # rikaichamp
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # sponsorblock
      # { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock

    ];
  };

  # dconf = {
  #   enable = true;
  #   settings."org/gnome/shell" = {
  #     disable-user-extensions = false;
  #     enabled-extensions = with pkgs.gnomeExtensions; [
  #       forge.extensionUuid
  #       fullscreen-avoider.extensionUuid
  #     ];
  #   };
  # };

  services = {
    gammastep = {
      enable = true;
      provider = "geoclue2";
      temperature = {
        day = 5500;
        night = 3700;
      };
    };

    redshift = {
      enable = true;
      provider = "geoclue2";
    };
  };

  systemd.user.services.gammastep.Install.WantedBy = [ "default.target" ];

  # programs.fish.enable = true;
  programs.command-not-found.enable = false;
  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };

  services = {
    syncthing = {
      enable = true;
    };
  };
}
