{...}: {
  programs.nixvim = {
    plugins.cmp = {
      settings = {
        snippet = {
          expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };

        mapping = {
          # Select the [n]ext item
          "<C-n>" = "cmp.mapping.select_next_item()";
          # Select the [p]revious item
          "<C-p>" = "cmp.mapping.select_prev_item()";
          # Scroll the documentation window [b]ack / [f]orward
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          # Accept ([y]es) the completion.
          #  This will auto-import if your LSP supports it.
          #  This will expand snippets if the LSP sent a snippet.
          #"<C-y>" = "cmp.mapping.confirm { select = true }";
          # If you prefer more traditional completion keymaps,
          # you can uncomment the following lines.
          "<CR>" = "cmp.mapping.confirm { select = true }";
          "<C-e>" = "cmp.abort";
          # "<Tab>" = "cmp.mapping.select_next_item()";
          # "<S-Tab>" = "cmp.mapping.select_prev_item()";

          # Manually trigger a completion from nvim-cmp.
          #  Generally you don't need this, because nvim-cmp will display
          #  completions whenever it has completion options available.
          "<C-Space>" = "cmp.mapping.complete {}";
        };

        sources = [
          {
            name = "luasnip";
          }
          # Adds other completion capabilites.
          #  nvim-cmp does not ship with all sources by default. They are split
          #  into multiple repos for maintenance purposes.
          {
            name = "nvim_lsp";
          }
          {
            name = "path";
          }
        ];
      };
    };

    extraLuaPackages = ps: [
      # Required by luasnip
      ps.jsregexp
    ];
  };
}
