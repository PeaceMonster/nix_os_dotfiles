{...}: {
  programs.nixvim.plugins.lsp.servers = {
    nixd.enable = true;
    rust-analyzer = {
      enable = true;
      installCargo = false;
      installRustc = false;
    };
    metals.enable = true;
  };
}