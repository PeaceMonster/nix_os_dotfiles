{ config, lib, pkgs, ...}:

{
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;

    keymaps = [
      {
      	key = "<C-s>";
        action = ":w<cr>";
        options.desc = "Save";
        options.silent = true;
      }
      {
        key = "<space>e";
        action = ":Ex<cr>";
        options.desc = "Open Netrw";
        options.silent = true;
      }

      # Buffers
      {
        key = "<space>bs";
        action = ":BufferPick<cr>";
        options.desc = "Pick a buffer";
        options.silent = true;
      }
      {
      	key = "<space>bd";
	action = "<cmd>BufferDelete<cr>";
	options.desc = "Delete current buffer";
      }
      {
        key = "H";
        action = ":BufferPrevious<cr>";
        options.desc = "Previous Buffer";
        options.silent = true;
      }
      {
        key = "L";
        action = ":BufferNext<cr>";
        options.desc = "Next Buffer";
        options.silent = true;
      }

      #Windows
      {
        key = "<space>|";
        action = "<cmd>vsplit<cr>";
        options.desc = "Create a vertical split";
      }
      {
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Change window to the right";
      }
      {
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Change window to the left";
      }
      {
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Change window down";
      }
      {
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Change window up";
      }
      


      # Trouble 
      {
      	key = "<space>cs";
	action = "<cmd>Trouble symbols toggle focus=false<cr>";
	options.desc = "Show Symbols";
      }
    ];

    plugins = {
      noice.enable = true;
      airline.enable = true;
      barbar.enable = true;
      which-key.enable = true;
      treesitter.enable = true;
      trouble.enable = true;
      lsp.enable = true;
    };

    plugins.lsp.servers = {
      nixd.enable = true;

    };
  };

}
