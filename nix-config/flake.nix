{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    ags.url = "github:Aylur/ags";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";
    matugen.url = "github:InioX/matugen";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";

      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs"; # Name of nixpkgs input you want to use
  };

  outputs =
    {
      self,
      nixpkgs,
      hyprland,
      home-manager,
      nur,
      lanzaboote,
      aagl,
      chaotic,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      globalModules = [
        lanzaboote.nixosModules.lanzaboote
        nur.nixosModules.nur
        (
          { config, ... }:
          {
            # environment.systemPackages = [ config.nur.repos.bandithedoge.zrythm ];
          }
        )
      ];
    in
    {
      packages = import ./pkgs pkgs;

      formatter.${system} = pkgs.nixfmt-rfc-style;

      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };

          modules = globalModules ++ [
            ./nixos/hosts/default/configuration.nix
            inputs.home-manager.nixosModules.default
            chaotic.nixosModules.default
            # {
            #   imports = [ aagl.nixosModules.default ];
            #   nix.settings = aagl.nixConfig; # Set up Cachix
            #   programs.sleepy-launcher.enable = true;
            # }
          ];
        };

        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };

          modules = globalModules ++ [
            ./nixos/hosts/laptop/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };

      };

      homeConfigurations = {
        default = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };

          extraSpecialArgs = {
            inherit inputs outputs;
          };

          modules = [ ./home-manager/home.nix ];
        };

        laptop = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };

          extraSpecialArgs = {
            inherit inputs outputs;
          };

          modules = [ ./home-manager/home.nix ];
        };

      };

      # homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
      #   pkgs = import nixpkgs { inherit system; };
      #
      #   extraSpecialArgs = {
      #     inherit inputs outputs;
      #   };
      #
      #   modules = [ ./home-manager/home.nix ];
      # };

      # homeConfigurations.laptop = home-manager.lib.homeManagerConfiguration {
      #   pkgs = import nixpkgs { inherit system; };
      #
      #   extraSpecialArgs = {
      #     inherit inputs outputs;
      #   };
      #
      #   modules = [ ./home-manager/home.nix ];
      # };
    };
}
