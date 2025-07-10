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

    # Stylix
    stylix.url = "github:nix-community/stylix/release-24.11";

    # Audiobook-dl
    audiobook-dl.url = "github:jo1gi/audiobook-dl";
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
        specialArgs = {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit inputs;};
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
      beast = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./beast/configuration.nix
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
          inherit inputs;
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
      beast = home-manager.lib.homeManagerConfiguration {
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
          ./beast/home.nix
        ];
      };
    };
  };
}
