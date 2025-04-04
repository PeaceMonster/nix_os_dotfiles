{
  config,
  lib,
  pkgs,
  pkgs-stable,
  ...
}:
{
  options = {
    languages.typst.enable = lib.mkEnableOption "Enable typst";
    languages.latex.enable = lib.mkEnableOption "Enable latex";
    languages.tectonic.enable = lib.mkEnableOption "Enable latex";
  };

  config = {
    home.packages =
      with pkgs;
      [ ]
      ++ (
        if config.languages.typst.enable then
          [
            typst
            tinymist
            typstyle
          ]
        else
          [ ]
      )
      ++ (
        if config.languages.latex.enable then
          [
            texlab
            texliveFull
            python312Packages.pygments
            python312Packages.grip
          ]
        else
          [ ]
      )
      ++ (
        if config.languages.tectonic.enable && config.languages.latex.enable then
          [

            pkgs-stable.tectonic
          ]
        else
          [ ]
      );
  };
}
