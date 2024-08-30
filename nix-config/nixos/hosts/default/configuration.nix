{
  config,
  pkgs,
  inputs,
  lib,
  outputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../base-configuration.nix
    ../../optional/steam.nix
  ];

  # boot.kernelPackages = pkgs.linuxPackages_6_8;
  boot.kernelPackages = pkgs.linuxPackages_xanmod_stable;
  # boot.kernelPackages = pkgs.linuxPackages_cachyos;
  # chaotic.scx.enable = true; # by default uses scx_rustland scheduler
}
