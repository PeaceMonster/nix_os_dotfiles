{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    languages.nix.enable = lib.mkEnableOption "Enable nix tools";
  };

  config = lib.mkIf config.languages.nix.enable {
    home.packages = with pkgs; [
      nixd
      alejandra #nixfmt
    ];
  };
}
