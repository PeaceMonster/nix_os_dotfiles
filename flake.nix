{
  description = "My configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";

    asus-wmi-screenpad.url = "github:MatthewCash/asus-wmi-screenpad-module";

    base16.url = "github:SenchoPens/base16.nix";
    tt-schemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };
    base16-zathura = {
      url = "github:haozeke/base16-zathura";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nix-index-database,
    base16,
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
          base16.nixosModule
          {scheme = "${inputs.tt-schemes}/base16/gruvbox.yaml";}
          nix-index-database.nixosModules.nix-index
        ];
      };
    };
    homeConfigurations = {
      ugilt = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          inputs.nixvim.homeManagerModules.nixvim
          ./home.nix
        ];
      };
    };
  };
}
