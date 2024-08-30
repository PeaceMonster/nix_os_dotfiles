{
  pkgs,
  lib,
  ...
}: {
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;

    plugins = {
      noice.enable = true;
      airline.enable = true;
      barbar.enable = true;
      which-key.enable = true;
      treesitter.enable = true;
      trouble.enable = true;
      lsp.enable = true;
      luasnip.enable = true;
      cmp.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      telescope.enable = true;
      mini = {
        enable = true;
        modules = {
          pairs = {};
          move = {};
          bracketed = {};
          surround = {};
        };
      };
      flash.enable = true;
      floaterm.enable = true;
      guess-indent.enable = true;
      illuminate.enable = true;
      lazygit.enable = true;
    };

    plugins.lsp.servers = {
      nixd.enable = true;
      rust-analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
    };
  };

  imports = [
    ./cmp.nix
    ./keymaps.nix
    ./conform.nix
  ];
}
