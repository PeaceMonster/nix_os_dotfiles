{
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
  home.packages = with pkgs; [
    cargo
    gnat14
    lua
    nodejs_22
    ocaml
    opam
    python3
    Rstudio-with-packages
    racket
    rustc
    wasm-pack
    typescript
    typst
    zig
    zulu21

    # LSP
    clang-tools
    emmet-language-server
    go
    godef
    gotools
    gopls
    jdt-language-server
    metals
    nixd
    tinymist
    vscode-langservers-extracted
    zls
    rust-analyzer
    texlab
    python312Packages.python-lsp-server

    # Formatters
    rustfmt
    alejandra #nixfmt
    typstyle

    tree-sitter
  ];
}
