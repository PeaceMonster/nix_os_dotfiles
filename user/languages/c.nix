{ config, lib, pkgs, ... }:

{

  options = {
    languages.c.enable = lib.mkEnableOption "Enable c lang and tools";
  };

  config = lib.mkIf config.languages.c.enable {
    home.packages = with pkgs; [
    gnat14
    clang-tools
    ];
  };
}
