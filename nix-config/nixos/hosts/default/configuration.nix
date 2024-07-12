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

  boot.kernelPackages = pkgs.linuxPackages_6_8;
}
