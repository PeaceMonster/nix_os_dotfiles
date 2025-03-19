{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    languages.go.enable = lib.mkEnableOption "Enable golang and tools";
  };

  config = lib.mkIf config.languages.go.enable {
    home.packages = with pkgs; [
      go
      godef
      gotools
      gopls
    ];
  };
}
