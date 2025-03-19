{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    languages.ocaml.enable = lib.mkEnableOption "Enable ocaml lang and tools";
  };

  config = lib.mkIf config.languages.ocaml.enable {
    home.packages = with pkgs; [
      ocaml
      opam
    ];
  };
}
