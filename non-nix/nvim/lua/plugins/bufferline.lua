return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			close_command = function(n) Snacks.bufdelete(n) end,
			right_mouse_command = function(n) Snacks.bufdelete(n) end,
			diagnostics = "nvim_lsp",
			always_show_bufferline = false,
		}
	}

}
