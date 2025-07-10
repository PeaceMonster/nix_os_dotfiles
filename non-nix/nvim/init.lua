--- Leader key
vim.keymap.set("", "<Space>", "<Nop>", {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " m"



require("config.options")


require("config.lazy")
require("lazy").setup({{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}})
require("colorscheme")


-- Treesitter
require"nvim-treesitter.configs".setup {
	ensure_installed = {
		"bash",
		"c",
		"diff",
		"html",
		"elixir",
		"javascript",
		"jsdoc",
		"json",
		"jsonc",
		"lua",
		"luadoc",
		"luap",
		"markdown",
		"markdown_inline",
		"printf",
		"python",
		"query",
		"regex",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
		"xml",
		"yaml",
	},
	auto_install = true,
	highlight = { enable = true },
	-- indent = { enable = true },
}

vim.opt.foldmethod = "expr"
vim.opt.foldlevelstart = 99

require("config.keybinds")
require("lsp")
