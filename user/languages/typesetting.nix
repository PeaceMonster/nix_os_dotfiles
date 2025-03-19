{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    languages.typst.enable = lib.mkEnableOption "Enable typst";
    languages.latex.enable = lib.mkEnableOption "Enable latex";
  };

  config = {
    home.packages =
      []
      ++ (
        if config.languages.typst.enable
        then [
          pkgs.typst
          pkgs.tinymist
          pkgs.typstyle
        ]
        else []
      )
      ++ (
        if config.languages.latex.enable
        then [
          pkgs.texlab
          pkgs.texliveFull
          pkgs.python312Packages.pygments
          pkgs.python312Packages.grip
        ]
        else []
      );
  };
}
