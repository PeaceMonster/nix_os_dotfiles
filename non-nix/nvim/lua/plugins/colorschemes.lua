return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	{
	  "vague2k/vague.nvim",
	  config = function()
		-- NOTE: you do not need to call setup if you don't want to.
		require("vague").setup({
		  -- optional configuration here
		})
	  end
	},
}
