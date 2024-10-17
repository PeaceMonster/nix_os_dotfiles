{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    # colorschemes.gruvbox.enable = true;

    extraConfigVim = ''
      set foldmethod=indent
      set foldlevel=99
      set nowrap
      set ts=4
    '';

    extraPlugins = with pkgs.vimPlugins; [
      # Mini Score thingy
      pest-vim

      #Zoxide integration
      zoxide-vim
    ];

    plugins = {
      airline.enable = true;
      barbar.enable = true;
      ccc.enable = true;
      cmp.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      dashboard.enable = true;
      emmet.enable = true;
      flash.enable = true;
      floaterm.enable = true;
      fzf-lua.enable = true;
      fugitive.enable = true;
      guess-indent.enable = true;
      illuminate.enable = true;
      lsp.enable = true;
      luasnip.enable = true;
      lazygit.enable = true;
      mini = {
        enable = true;
        modules = {
          bracketed = {};
          icons = {};
          move = {};
          pairs = {};
          surround = {};
        };
      };
      neoclip.enable = true;
      neoscroll.enable = true;
      nix-develop.enable = true;
      noice.enable = true;
      nvim-ufo.enable = true;
      oil.enable = true;
      orgmode.enable = true;
      persistence.enable = true;
      project-nvim = {
        enable = true;
        enableTelescope = true;
      };
      rainbow-delimiters.enable = true;
      scope.enable = true;
      treesitter.enable = true;
      trouble.enable = true;
      todo-comments.enable = true;
      treesitter-refactor.enable = true;
      twilight.enable = true;
      telescope.enable = true;
      typst-vim.enable = true;
      vim-css-color.enable = true;
      which-key.enable = true;
      web-devicons.enable = true;
      yazi = {
        enable = true;
        settings.use_ya_for_events_reading = true;
      };
      zen-mode.enable = true;
      zig.enable = true;
    };
  };

  imports = [
    ./cmp.nix
    ./keymaps.nix
    ./conform.nix
    ./lsp-config.nix
  ];
}
