{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zrythm.url = "github:PowerUser64/nixpkgs/zrythm-6.3-b";

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
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;

      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
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

        # pass inputs as specialArgs
        extraSpecialArgs = {
          inherit inputs;
        };

        # import your home.nix
        modules = [ ./home-manager/home.nix ];
      };
    };
}
