{pkgs, ...}: {
  home.packages = with pkgs; [
    python3
    typst
    cargo
    libgccjit
    rustc

    # LSP
    nixd
    rust-analyzer
    metals

    # Formatters
    rustfmt
    alejandra #nixfmt
  ];
}
