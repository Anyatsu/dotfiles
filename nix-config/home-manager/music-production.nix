{ pkgs, ... }:
{
  home.packages =
    with pkgs;
    [
      wineWowPackages.staging
      winetricks

      yabridge
      yabridgectl

      lsp-plugins
      vital

      # Guitar
      guitarix
      gxplugins-lv2
      rakarrack
      neural-amp-modeler-lv2

      reaper
    ];
}
