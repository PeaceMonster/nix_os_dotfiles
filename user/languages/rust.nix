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
      wasm-pack
      cargo
      rust-analyzer
      rustfmt
      rustc
      clippy
    ];
  };
}
