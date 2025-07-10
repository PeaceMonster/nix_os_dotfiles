return {
	"hat0uma/csvview.nvim",
	opts = {
		parser = { comments = { "#", "//" } },
		display_mode = "border",
	},
	cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
	ft = { "csv"},
}

-- return {
-- 	"emmanueltouzery/decisive.nvim",
-- 	config = function()
-- 		require("decisive").setup{}
-- 	end,
-- 	lazy = true,
-- 	ft = { "csv" },
-- }
