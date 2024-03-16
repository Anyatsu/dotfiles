{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wineWowPackages.stable
    winetricks

    yabridge
    yabridgectl

    lsp-plugins
    vital

    hydrogen
    drumgizmo

    # Guitar
    guitarix
    rakarrack
    neural-amp-modeler-lv2

    carla
    reaper
  ];
}
