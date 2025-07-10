return {
		"saghen/blink.cmp",

		dependencies = { "rafamadriz/friendly-snippets" },

		version = "*",

		opts = {
			keymap = {
				preset = "enter"
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
			completion = {
				keyword = { range = "prefix" },
				menu = {
					draw = {
						treesitter = { "lsp" },
					},
				},
				trigger = { show_on_trigger_character = true },
			},
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	}
