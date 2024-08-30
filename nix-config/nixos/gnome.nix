{ config, pkgs, ... }:
{
  environment = {
    sessionVariables = {
      NAUTILUS_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
    };

    pathsToLink = [ "/share/nautilus-python/extensions" ];

    systemPackages = with pkgs; [
      qogir-icon-theme
      gnome-extension-manager
      nautilus-open-any-terminal
      nautilus-python
      wl-clipboard
      gnomeExtensions.forge
      gnomeExtensions.fullscreen-avoider
    ];

    gnome.excludePackages =
      (with pkgs; [
        # gnome-text-editor
        gnome-console
        gnome-photos
        gnome-tour
        gnome-connections
        snapshot
        gedit
        cheese # webcam tool
        epiphany # web browser
        geary # email reader
        evince # document viewer
        totem # video player
        yelp # Help view
        gnome-font-viewer
      ])
      ++ (with pkgs.gnome; [
        gnome-music
        gnome-characters
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
        gnome-contacts
        gnome-initial-setup
        gnome-shell-extensions
        gnome-maps
      ]);
  };

  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome = {
      enable = true;
      extraGSettingsOverridePackages = [ pkgs.nautilus-open-any-terminal ];
    };
  };

  # programs.dconf.profiles = {
  #   gdm.databases = [
  #     {
  #       settings = {
  #         "org/gnome/desktop/peripherals/touchpad" = {
  #           tap-to-click = true;
  #         };
  #         "org/gnome/desktop/interface" = {
  #           cursor-theme = "Qogir";
  #         };
  #       };
  #     }
  #   ];
  # };
}
