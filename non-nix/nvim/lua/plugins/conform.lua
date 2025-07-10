return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			go = { "gofmt" },
			nix = { "alejandra" },
		},

		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
