{pkgs, ...}: {
  home.packages = with pkgs; [
    cargo
    gcc9
    python3
    rustc
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

    # Formatters
    rustfmt
    alejandra #nixfmt
    typstyle

    # Pip packages
    python312Packages.pyyaml
  ];
}
