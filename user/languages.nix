{pkgs, ...}: {
  home.packages = with pkgs; [
    cargo
    gnat14
    lua
    nodejs_22
    ocaml
    python3
    R
    racket
    rustc
    typescript
    typst
    zig
    zulu21

    # LSP
    clang-tools
    emmet-language-server
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
  ] ++ (with pkgs.rPackages; [ # R packages
      stringi
      stringr
  ]);
}
