{
  config,
  lib,
  pkgs,
  ...
}:
{
	options = {
		languages.gleam.enable = lib.mkEnableOption "Enable gleam tools, and the gleam language";
	};

	config = lib.mkIf config.languages.gleam.enable {
		home.packages = with pkgs; [
			gleam
		];
	};
}
