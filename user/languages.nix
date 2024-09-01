{pkgs, ...}: {
  home.packages = with pkgs; [
    python3
    typst
    cargo
    rustc
    gcc9

    # LSP
    nixd
    rust-analyzer
    metals
    typst-lsp

    # Formatters
    rustfmt
    alejandra #nixfmt
    typstyle
  ];
}
