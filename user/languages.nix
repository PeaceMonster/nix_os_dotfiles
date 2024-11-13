{pkgs, ...}: {
  home.packages = with pkgs; [
    cargo
    gnat14
    lua
    nodejs_22
    python3
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
    metals
    nixd
    nodePackages.typescript-language-server
    typst-lsp
    vscode-langservers-extracted
    zls
    rust-analyzer
    texlab

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
