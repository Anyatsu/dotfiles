# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  guitarix = pkgs.callPackage ./guitarix.nix { };
  discord-ipc = pkgs.callPackage ./discord-ipc.nix { };
}
