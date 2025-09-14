{
  pkgs,
  pkgs-stable,
  lib,
  ...
}:
{
  imports = [
    ./zig.nix
    ./c.nix
    ./gleam.nix
    ./go.nix
    ./java.nix
    ./nix.nix
	./elm.nix
    ./ocaml.nix
    ./r.nix
    ./rust.nix
    ./typesetting.nix
    ./web.nix
    ./python.nix
	./lua.nix
  ];

  languages = {
    c.enable = lib.mkDefault true;
    R.enable = lib.mkDefault true;
    elm.enable = lib.mkDefault true;
    gleam.enable = lib.mkDefault true;
    go.enable = lib.mkDefault true;
    java.enable = lib.mkDefault false;
    latex.enable = lib.mkDefault true;
    markdown.enable = lib.mkDefault true;
    nix.enable = lib.mkDefault true;
    ocaml.enable = lib.mkDefault true;
    python.enable = lib.mkDefault true;
    rust.enable = lib.mkDefault true;
    typst.enable = lib.mkDefault true;
    tectonic.enable = lib.mkDefault true;
    web.enable = lib.mkDefault true;
    zig.enable = lib.mkDefault true;
    lua.enable = lib.mkDefault true;
  };

  home.packages = with pkgs; [
    racket
    tree-sitter
  ];
}
