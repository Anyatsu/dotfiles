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

    gnome.excludePackages = (
      with pkgs;
      [
        # gnome-text-editor
        gnome-photos
        xdg-desktop-portal-gtk
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
        gnome.gnome-characters
        gnome.gnome-initial-setup
        gnome.gnome-shell-extensions
        gnome.gnome-maps
        gnome-font-viewer
      ]
    );
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
