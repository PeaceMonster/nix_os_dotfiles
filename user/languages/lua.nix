{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    languages.lua.enable = lib.mkEnableOption "Enable lua lang and tools";
  };

  config = lib.mkIf config.languages.lua.enable {
    home.packages = with pkgs; [
	  lua
	  lua-language-server
    ];
  };
}
