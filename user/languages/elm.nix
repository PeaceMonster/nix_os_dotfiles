{
  config,
  lib,
  pkgs,
  pkgs-stable,
  ...
}:
{
	options = {
		languages.elm.enable = lib.mkEnableOption "Enable elm tools, and the elm language";
	};

	config = lib.mkIf config.languages.elm.enable {
		home.packages = with pkgs.elmPackages; [
			elm
			elm-language-server
		];
	};
}
