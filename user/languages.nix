{pkgs, ...}: {
  home.packages = with pkgs; [
    python3
    typst
    cargo
    rustc
    gcc9
    zig

    # LSP
    nixd
    metals
    typst-lsp
    emmet-language-server
    jdt-language-server
    vscode-langservers-extracted

    # Formatters
    rustfmt
    alejandra #nixfmt
    typstyle
  ];
}
