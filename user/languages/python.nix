{ config, lib, pkgs, ... }:

{

  options = {
    languages.python.enable = lib.mkEnableOption "Enable python lang and tools";
  };

  config = lib.mkIf config.languages.python.enable {
    home.packages = with pkgs; [
    python3
    python312Packages.python-lsp-server
    ];
  };
}
