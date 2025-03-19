{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    languages.rust.enable = lib.mkEnableOption "Enable rust lang, and tools";
  };

  config = lib.mkIf config.languages.rust.enable {
    home.packages = with pkgs; [
      cargo
      rust-analyzer
      rustfmt
      rustc
    ];
  };
}
