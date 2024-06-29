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
    ../../base-configuration.nix
    # ../../configuration.nix
  ];

  services.displayManager.autoLogin = {
    enable = lib.mkForce false;
    user = "yuval";
  };
}
