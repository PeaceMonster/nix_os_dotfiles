{pkgs,pkgs-stable,...}:
let
  Rstudio-with-packages = pkgs-stable.rstudioWrapper.override{
    packages = with pkgs.rPackages; [ # R packages
      # stringi
      # stringr
  ];};
in
{
  home.packages = with pkgs; [
    cargo
    gnat14
    lua
    nodejs_22
    ocaml
    python3
    Rstudio-with-packages
    racket
    rustc
    typescript
    typst
    zig
    zulu21

    # LSP
    clang-tools
    emmet-language-server
    go
    jdt-language-server
    lua-language-server
    metals
    ocamlPackages.lsp
    nixd
    nodePackages.typescript-language-server
    tinymist
    vscode-langservers-extracted
    zls
    rust-analyzer
    texlab

    # Ocaml Things
    dune_3
    opam
    ocamlPackages.merlin
    ocamlPackages.findlib
    ocamlPackages.utop
    ocamlPackages.ocp-indent
    ocamlPackages.ocamlformat
    ocamlPackages.menhir

    # Formatters
    rustfmt
    alejandra #nixfmt
    typstyle

    # Pip packages
    python312Packages.pyyaml

    tree-sitter
    tree-sitter-grammars.tree-sitter-typst
  ];
}
