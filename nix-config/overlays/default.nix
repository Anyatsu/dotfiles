# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs final;

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # guitarix = prev.guitarix.overrideAttrs (
    #   oldAttrs: {
    #     src = final.fetchurl {
    #       url = "https://github.com/brummer10/guitarix/releases/download/V0.46.0/guitarix2-0.46.0.tar.xz";
    #       sha256 = "sha256-xmC+s/Fs3EVdmebwdM1uorHxDB38SA6EIQRhY33JjEQ=";
    #     };
    #   }
    # );
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
