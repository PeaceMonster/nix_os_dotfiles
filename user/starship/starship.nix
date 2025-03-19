{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    starship.enable = lib.mkEnableOption "Enable starship";
    starship.fish.enable = lib.mkEnableOption "Enable fish integration";
    starship.bash.enable = lib.mkEnableOption "Enable bash integration";
    starship.zsh.enable = lib.mkEnableOption "Enable zsh integration";

  };

  config = {
    programs.starship = {
      enable = config.starship.enable;
      enableFishIntegration = config.starship.fish.enable;
      settings = pkgs.lib.importTOML ./starship.toml;
      enableTransience = true;
    };
  };
}
