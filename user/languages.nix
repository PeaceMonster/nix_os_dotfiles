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

    # Formatters
    rustfmt
    alejandra #nixfmt
  ];
}
