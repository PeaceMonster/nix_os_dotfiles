{...}: {
  programs.nixvim = {
    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<space>b";
        group = "Buffers";
      }
      {
        __unkeyed = "<space>t";
        group = "Telescope";
      }
      {
        __unkeyed = "<space>u";
        group = "Ui";
      }
      {
        __unkeyed = "<space>w";
        group = "Windows";
      }
      {
        __unkeyed = "<space>c";
        group = "Code";
      }
    ];

    keymaps = [
      {
        key = "<C-s>";
        action = "<cmd>w<cr>";
        options.desc = "Save";
        options.silent = true;
      }
      {
        key = "<space>e";
        action = "<cmd>Oil<cr>";
        options.desc = "Open Netrw";
        options.silent = true;
      }
      {
        key = "<space>q";
        action = "<cmd>qa<cr>";
        options.desc = "Quit Nvim";
      }
      {
        key = "<escape>";
        action = "<cmd>noh<cr>";
        mode = "n";
        options.noremap = true;
      }
      {
        key = "<space>uz";
        action = "<cmd>ZenMode<cr>";
        options.desc = "Toggle zenmode";
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
        key = "<space>_";
        action = "<cmd>split<cr>";
        options.desc = "Create a horizontal split";
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
      {
        key = "<space>wd";
        action = "<C-w>q";
        options.desc = "Kill window";
      }

      # Telescope
      {
        key = "<space><space>";
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Telescope Find Files";
      }
      {
        key = "<space>tf";
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Telescope Find Files";
      }
      {
        key = "<space>tb";
        action = "<cmd>Telescope buffers<cr>";
        options.desc = "Telescope buffers";
      }
      {
        key = "<space>tg";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Telescope live grep";
      }
      {
        key = "<space>\\";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Telescope live grep";
      }
      {
        key = "<space>tq";
        action = "<cmd>Telescope quickfix<cr>";
        options.desc = "Telescope quickfix";
      }
      {
        key = "<space>uc";
        action = "<cmd>Telescope colorscheme preview=true<cr>";
        options.desc = "Pick colorscheme";
      }
      {
        key = "<space>tc";
        action = "<cmd>Telescope neoclip<cr>";
        options.desc = "Telescope neoclip";
      }

      # Trouble
      {
        key = "<space>cs";
        action = "<cmd>Trouble symbols toggle focus=false<cr>";
        options.desc = "Show Symbols";
      }

      # Float Term
      {
        key = "<space>ut";
        action = "<cmd>FloatermToggle<cr>";
        options.desc = "Toggle floatterm";
      }
      {
        key = "<C-n>";
        action = "<C-\\><C-n>";
        options.desc = "Escape terminal mode";
        mode = ["t"];
      }

      # Lazygit
      {
        key = "<space>gg";
        action = "<cmd>LazyGit<cr>";
        options.desc = "Open LazyGit";
      }

      # Fzflua
      {
        key = "<space>ca";
        action = "<cmd>FzfLua lsp_code_actions<cr>";
        options.desc = "Code actions";
      }

      # Lsp
      {
        key = "gd";
        action = "<C-]>";
        options.desc = "Go to definition";
      }
    ];
  };
}
