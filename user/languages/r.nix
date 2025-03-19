{
  config,
  lib,
  pkgs,
  pkgs-stable,
  ...
}: let
  Rstudio-with-packages = pkgs-stable.rstudioWrapper.override {
    packages = with pkgs.rPackages; [
      # R packages
      # stringi
      # stringr
    ];
  };
in {
  options = {
    languages.R.enable = lib.mkEnableOption "Enable R lang, and tools";
  };

  config = lib.mkIf config.languages.R.enable {
    home.packages = with pkgs; [
      Rstudio-with-packages
    ];
  };
}
