{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    ags.url = "github:Aylur/ags";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs"; };

    musnix  = { url = "github:musnix/musnix"; };
    matugen.url = "github:InioX/matugen";
  };

  outputs = { self, nixpkgs, hyprland, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./nixos/configuration.nix
            inputs.home-manager.nixosModules.default
#            hyprland.nixosModules.default
#	    {programs.hyprland = {
#              enable = true;
#              xwayland.enable = true;
#            };
#
#            programs.waybar.package = inputs.hyprland.packages.${system}.waybar-hyprland; }
#            inputs.musnix.nixosModules.musnix

          ];
        };

      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; };

        # pass inputs as specialArgs
        extraSpecialArgs = { inherit inputs; };

        # import your home.nix
        modules = [ ./home-manager/home.nix ];
      };
  };
}
