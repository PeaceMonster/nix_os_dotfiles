{
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    ./go.nix
    ./java.nix
    ./nix.nix
    ./ocaml.nix
    ./r.nix
    ./rust.nix
    ./typesetting.nix
    ./web.nix
  ];

  languages = {
    R.enable = true;
    go.enable = true;
    java.enable = false;
    latex.enable = true;
    nix.enable = true;
    ocaml.enable = true;
    rust.enable = true;
    typst.enable = true;
    web.enable = true;
  };

  home.packages = with pkgs; [
    gnat14
    lua
    python3
    racket
    zig

    # LSP
    clang-tools
    zls
    python312Packages.python-lsp-server

    # Formatters

    tree-sitter
  ];
}
