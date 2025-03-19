{
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    ./rust.nix
    ./r.nix
  ];

  languages.rust.enable = true;
  languages.R.enable = true;

  home.packages = with pkgs; [
    gnat14
    lua
    nodejs_22
    ocaml
    opam
    python3
    racket
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
    texlab
    python312Packages.python-lsp-server

    # Formatters
    alejandra #nixfmt
    typstyle

    tree-sitter
  ];
}
