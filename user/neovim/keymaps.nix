{...}: {
  programs.nixvim = {
    plugins.which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>b";
        group = "Buffers";
      }
      {
        __unkeyed = "<leader>t";
        group = "Telescope";
      }
      {
        __unkeyed = "<leader>u";
        group = "Ui";
      }
      {
        __unkeyed = "<leader>w";
        group = "Windows";
      }
      {
        __unkeyed = "<leader>c";
        group = "Code";
      }
      {
        __unkeyed = "<leader>c";
        group = "Git";
      }
      {
        __unkeyed = "<leader>s";
        group = "Mini surround";
      }
      {
        __unkeyed = "<leader>o";
        group = "Oil";
      }
      {
        __unkeyed-2 = "<leader><Tab>";
        group = "Tabs";
      }
    ];

    globals.mapleader = " ";

    keymaps = [
      {
        key = "j";
        action = "gj";
      }
      {
        key = "k";
        action = "gk";
      }
      {
        key = "<C-s>";
        action = "<cmd>w<cr>";
        options.desc = "Save";
        options.silent = true;
        mode = ["n" "i"];
      }
      {
        key = "<leader>e";
        action = "<cmd>Oil<cr>";
        options.desc = "Open Netrw";
        options.silent = true;
      }
      {
        key = "<leader>q";
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
        key = "<leader>uz";
        action = "<cmd>ZenMode<cr>";
        options.desc = "Toggle zenmode";
      }
      {
        key = "s";
        action = "<cmd>lua require('flash').jump()<cr>";
        options.desc = "Flash jump";
      }
      {
        key = "S";
        action = "<cmd>lua require('flash').treesitter()<cr>";
        options.desc = "Flash treesitter jump";
      }

      # Buffers
      {
        key = "<leader>bs";
        action = ":BufferPick<cr>";
        options.desc = "Pick a buffer";
        options.silent = true;
      }
      {
        key = "<leader>bd";
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
        key = "<leader>|";
        action = "<cmd>vsplit<cr>";
        options.desc = "Create a vertical split";
      }
      {
        key = "<leader>_";
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
        key = "<C-Up>";
        action = "<C-w>+";
        options.desc = "Increase window height";
      }
      {
        key = "<C-Down>";
        action = "<C-w>-";
        options.desc = "Decrease window height";
      }
      {
        key = "<C-Right>";
        action = "<C-w>>";
        options.desc = "Increase window width";
      }
      {
        key = "<C-Left>";
        action = "<C-w><";
        options.desc = "Decrease window width";
      }

      {
        key = "<leader>wd";
        action = "<C-w>q";
        options.desc = "Kill window";
      }

      # Tabs
      {
        key = "<leader><Tab>n";
        action = "<cmd>tabnext<cr>";
        options.desc = "Next tab";
      }
      {
        key = "<leader><Tab>p";
        action = "<cmd>tabprevious<cr>";
        options.desc = "Previous tab";
      }
      {
        key = "<leader><Tab>c";
        action = "<cmd>tabnew<cr>";
        options.desc = "Create new tab";
      }
      {
        key = "<leader><tab>d";
        action = "<cmd>tabclose<cr>";
        options.desc = "Close tab";
      }

      # Telescope
      {
        key = "<leader><leader>";
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Telescope Find Files";
      }
      {
        key = "<leader>tf";
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Telescope Find Files";
      }
      {
        key = "<leader>tb";
        action = "<cmd>Telescope buffers<cr>";
        options.desc = "Telescope buffers";
      }
      {
        key = "<leader>tg";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Telescope live grep";
      }
      {
        key = "<leader>\\";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Telescope live grep";
      }
      {
        key = "<leader>tq";
        action = "<cmd>Telescope quickfix<cr>";
        options.desc = "Telescope quickfix";
      }
      {
        key = "<leader>uc";
        action = "<cmd>Telescope colorscheme preview=true<cr>";
        options.desc = "Pick colorscheme";
      }
      {
        key = "<leader>tc";
        action = "<cmd>Telescope neoclip<cr>";
        options.desc = "Telescope neoclip";
      }

      # Trouble
      {
        key = "<leader>cs";
        action = "<cmd>Trouble symbols toggle focus=false<cr>";
        options.desc = "Show Symbols";
      }
      {
        key = "<leader>ct";
        action = "<cmd>Trouble todo toggle";
        options.desc = "Show Todos";
      }

      # Float Term
      {
        key = "<leader>ut";
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
        key = "<leader>gg";
        action = "<cmd>LazyGit<cr>";
        options.desc = "Open LazyGit";
      }

      # Fzflua
      {
        key = "<leader>ca";
        action = "<cmd>FzfLua lsp_code_actions<cr>";
        options.desc = "Code actions";
      }

      # Lsp
      {
        key = "gd";
        action = "<C-]>";
        options.desc = "Go to definition";
      }

      # Guess Indent
      {
        key = "<leader>cg";
        action = "<cmd>GuessIndent<cr>";
        options.desc = "Guess indent of current file";
      }

      # Dashboard
      {
        key = "<leader>ud";
        action = "<cmd>Dashboard<cr>";
        options.desc = "Open Dashboard";
      }

      # Zoxide
      {
        key = "<leader>z";
        action = ":Z ";
        options.desc = "Open z-jump";
      }

      # Yazi
      {
        key = "<leader>yy";
        action.__raw = ''
          function()
            require('yazi').yazi()
          end
        '';
        options.desc = "Open Yazi";
      }
    ];

    plugins.mini.modules.surround.mappings = {
      add = "<leader>sa";
      delete = "<leader>sd";
      find = "<leader>sf";
      find_left = "<leader>sF";
      highlight = "<leader>sh";
      replace = "<leader>sr";
      update_n_lines = "<leader>sn";
    };

    plugins.oil.settings.keymaps = {
      "<leader>ov" = "actions.select_vsplit";
      "<leader>op" = "actions.preview";
      "<leader>or" = "actions.refresh";
      "<leader>oh" = "actions.toggle_hidden";

      "<C-s>" = false;
      "<C-p>" = false;
      "<C-l>" = false;
      "g." = false;
    };
  };
}
