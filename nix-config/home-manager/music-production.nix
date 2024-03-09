
{ pkgs, ... }:
{
  home.packages = with pkgs; with gnome; [
    wine-staging
    winetricks

    yabridge
    yabridgectl

    lsp-plugins
    guitarix
    gxplugins-lv2
    vital

    reaper
  ];
}
