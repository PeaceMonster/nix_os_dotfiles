vim.keymap.set("n", "<localleader>a", ":CsvViewEnable display_mode=border<CR>", { silent = true })
vim.keymap.set("n", "<localleader>A", ":CsvViewDisable<CR>", { silent = true })
vim.keymap.set("n", "<Tab>", ":lua require('csvview.jump').next_field_start()<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":lua require('csvview.jump').prev_field_start()<CR>", { silent = true })

vim.keymap.set({ "o", "x" }, "if", function()
	require("csvview.textobject").field(0, { include_delimiter = false })
end)

vim.keymap.set({ "o", "x" }, "af", function()
	require("csvview.textobject").field(0, { include_delimiter = true })
end)
