-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, keys, cmd)
	local options = { noremap = true }
	vim.api.nvim_set_keymap(mode, keys, cmd, options)
end

map("n", "<C-s>", "<cmd>w<CR>")
map("i", "<C-s>", "<cmd>w<CR>")

map("t", "<Esc>", "<C-\\><C-n>")

map("n", "<C-c>", "<cmd>CccPick<CR>")

map("n", "<C-j>", "5j")
map("n", "<C-k>", "5k")
