{...}: {
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
      neoclip.enable = true;
      neoscroll.enable = true;
      fzf-lua.enable = true;
      oil.enable = true;
      todo-comments.enable = true;
      treesitter-refactor.enable = true;
      twilight.enable = true;
      zen-mode.enable = true;
      vim-css-color.enable = true;
    };
  };

  imports = [
    ./cmp.nix
    ./keymaps.nix
    ./conform.nix
    ./lsp-config.nix
  ];
}
