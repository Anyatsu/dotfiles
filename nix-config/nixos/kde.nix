{ config, pkgs, ... }:
{
  environment = {
    sessionVariables = {
      KWIN_X11_NO_SYNC_TO_VBLANK = 1;
    };

    plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      # konsole
      oxygen
    ];
  };

  services.xserver = {
    enable = true;
  };

  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
