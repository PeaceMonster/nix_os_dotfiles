{
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    ./zig.nix
    ./c.nix
    ./go.nix
    ./java.nix
    ./nix.nix
    ./ocaml.nix
    ./r.nix
    ./rust.nix
    ./typesetting.nix
    ./web.nix
    ./python.nix
  ];

  languages = {
    c.enable = true;
    R.enable = true;
    go.enable = true;
    java.enable = false;
    latex.enable = true;
    nix.enable = true;
    ocaml.enable = true;
    python.enable = true;
    rust.enable = true;
    typst.enable = true;
    web.enable = true;
    zig.enable = true;
  };

  home.packages = with pkgs; [
    lua
    racket
    tree-sitter
  ];
}
