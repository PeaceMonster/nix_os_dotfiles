{pkgs, ...}: {
  home.packages = with pkgs; [
    # gcc9
    cargo
    clang
    python3
    racket
    rustc
    typescript
    typst
    zig

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
