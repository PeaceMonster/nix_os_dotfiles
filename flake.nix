{
  description = "My configuration";

  inputs = {
    # Nix packages
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.05";

    # Home Manger
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Comma
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    # Nixvim
    nixvim.url = "github:nix-community/nixvim";

    # Duo screenpad hack
    asus-wmi-screenpad.url = "github:MatthewCash/asus-wmi-screenpad-module";
    asus-wmi-screenpad.inputs.nixpkgs.follows = "nixpkgs";

    # Stylix
    stylix.url = "github:danth/stylix";
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nix-index-database,
    stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      ugilt = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          nix-index-database.nixosModules.nix-index
        ];
      };
      station = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./station/configuration.nix
          nix-index-database.nixosModules.nix-index
        ];
      };
    };
    homeConfigurations = {
      ugilt = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          inputs.nixvim.homeManagerModules.nixvim
          stylix.homeManagerModules.stylix
          ./home.nix
        ];
      };
      station = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          inputs.nixvim.homeManagerModules.nixvim
          stylix.homeManagerModules.stylix
          ./station/home.nix
        ];
      };
    };
  };
}
