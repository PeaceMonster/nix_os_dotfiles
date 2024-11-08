{...}: {
  programs.nixvim.plugins.lsp.servers = {
    nixd.enable = true;
    rust_analyzer = {
      enable = true;
      installCargo = false;
      installRustc = false;
    };
    metals.enable = true;
    typst_lsp.enable = true;
    jdt_language-server.enable = true;
    cssls.enable = true;
    zls.enable = true;
    # sourcekit.enable = true;
    # ccls.enable = true;
    clangd.enable = true;
    ts_ls.enable = true;
  };

  programs.nixvim.extraConfigLua = ''
    require('lspconfig').emmet_language_server.setup{}
    require'lspconfig'.jedi_language_server.setup{}
  '';
}
