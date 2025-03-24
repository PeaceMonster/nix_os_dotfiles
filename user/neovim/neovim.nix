{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    neovim.nixvim.enable = lib.mkEnableOption "Configure Neovim with Nixvim";
    neovim.neovide.enable = lib.mkEnableOption "Enable Neovide";
    neovim.enable = lib.mkEnableOption "Enable Neovim";
  };

  config = lib.mkIf config.neovim.enable {
    programs.nixvim = {
      enable = config.neovim.nixvim.enable;

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
        comment-box.enable = true;
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

    home.packages = with pkgs;
      []
      ++ (
        if config.neovim.neovide.enable
        then [
          neovide
        ]
        else []
      )
      ++ (
        if (config.neovim.enable) && (!config.neovim.nixvim.enable)
        then [
          neovim
        ]
        else []
      );

    neovim.nixvim.enable = lib.mkDefault false;
    neovim.neovide.enable = lib.mkDefault false;
  };
  imports = [
    ./cmp.nix
    ./keymaps.nix
    ./conform.nix
    ./lsp-config.nix
  ];
}
