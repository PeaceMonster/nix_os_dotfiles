		-- {
			-- "echasnovski/",
			-- config = function(_, opts)
				-- require("mini.").setup(opts)
			-- end,
		-- },
return {
    {
        "echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end
    },
	{
		"echasnovski/mini.surround",
		opts = {
			mappings = {
				add = "gsa",
				delete = "gsd",
				find = "gsf",
				find_left = "gsF",
				highlight = "gsh",
				replace = "gsr",
				update_n_lines = "gsn",
			},
		},
		config = function(_, opts)
			require("mini.surround").setup(opts)
		end
	},
	{
		"echasnovski/mini.move",
		config = function(_, opts)
			require("mini.move").setup(opts)
		end,
	},

}

