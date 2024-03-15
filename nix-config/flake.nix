{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    ags.url = "github:Aylur/ags";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    musnix = {
      url = "github:musnix/musnix";
    };
    matugen.url = "github:InioX/matugen";
    nix-gaming.url = "github:fufexan/nix-gaming";
  };

  outputs =
    {
      self,
      nixpkgs,
      hyprland,
      home-manager,
      nur,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Your custom packages
      # Accessible through 'nix build', 'nix shell', etc
      packages = import ./pkgs pkgs;

      formatter.${system} = pkgs.nixfmt-rfc-style;

      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
        };

        modules = [
          ./nixos/configuration.nix
          inputs.home-manager.nixosModules.default
          nur.nixosModules.nur
          (
            { config, ... }:
            {
              environment.systemPackages = [ config.nur.repos.bandithedoge.zrythm ];
            }
          )
        ];
      };

      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; };

        extraSpecialArgs = {
          inherit inputs outputs;
        };

        modules = [ ./home-manager/home.nix ];
      };
    };
}
