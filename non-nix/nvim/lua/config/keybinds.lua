local wk = require("which-key")

local default_opts = {
	noremap = true,
	silent = true,
}

local function normalmap(bind)
	local opts = {}
	if bind.opts then
		opts = bind.opts
	end
	vim.keymap.set("n", bind[1], bind[2], vim.tbl_extend("keep", opts, default_opts))
end

local function bindGroup(leader, group)
	local groupLeader = leader .. group.leader
	if group.desc then
		wk.add({
			{ groupLeader, group = group.desc },
		})
	end

	for _, bind in pairs(group.binds) do
		local opts = {}

		if bind.opts then
			opts = bind.opts
		end

		if bind.group then
			bindGroup(groupLeader, bind)
		else
			vim.keymap.set(bind[1], groupLeader .. bind[2], bind[3], vim.tbl_extend("keep", opts, default_opts))
		end
	end
end

local file_binds = {
	group = true,
	leader = "f",
	desc = "File",
	binds = {
		{ "n", "s", ":w<CR>", opts = { desc = "Save current file" } },
		{ "n", "S", ":wa<CR>", opts = { desc = "Save all files" } },
	},
}

local quit_binds = {
	group = true,
	leader = "q",
	desc = "Quit",
	binds = {
		{ "n", "q", ":qa<CR>", opts = { desc = "Quit All" } },
	},
}

local buffer_binds = {
	group = true,
	leader = "b",
	desc = "Buffer",
	binds = {
		{ "n", "n", ":bn<CR>", opts = { desc = "Next Buffer" } },
		{ "n", "p", ":bp<CR>", opts = { desc = "Previous Buffer" } },
		{ "n", "d", ":bd<CR>", opts = { desc = "Delete Buffer" } },
	},
}

local git_binds = {
	group = true,
	leader = "g",
	desc = "Git",
	binds = {
		{ "n", "g", ":Git<CR>" },
	},
}

local ts = require("telescope.builtin")
local telescope_binds = {
	group = true,
	leader = "s",
	desc = "Search",
	binds = {
		{ "n", "s", ts.find_files, opts = { desc = "Telescope Find Files" } },
		{ "n", "g", ts.live_grep, opts = { desc = "Telescope live grep" } },
		{ "n", "b", ts.current_buffer_fuzzy_find, opts = { desc = "Telescope find in buffer" } },
	},
}

local code_binds = {
	group = true,
	leader = "c",
	desc = "Code",
	binds = {
		{ "n", "s", "<cmd>Trouble symbols toggle<cr>" },
		{ "n", "S", "<cmd>Trouble lsp toggle<cr>" },
		{ "n", "a", require("actions-preview").code_actions, opts = { desc = "Code action" } },
		{ { "n", "v" }, "f", require("conform").format, opts = { desc = "Format buffer" } },
	},
}

local window_binds = {
	group = true,
	leader = "w",
	desc = "Windows",
	binds = {
		{ "n", "h", "<C-w>h", opts = { desc = "Move left" } },
		{ "n", "l", "<C-w>l", opts = { desc = "Move right" } },
		{ "n", "j", "<C-w>j", opts = { desc = "Move down" } },
		{ "n", "k", "<C-w>k", opts = { desc = "Move up" } },
		{ "n", "H", "<C-w>H", opts = { desc = "Shift left" } },
		{ "n", "L", "<C-w>L", opts = { desc = "Shift right" } },
		{ "n", "J", "<C-w>J", opts = { desc = "Shift down" } },
		{ "n", "K", "<C-w>K", opts = { desc = "Shift up" } },
		{ "n", "v", "<C-w>v", opts = { desc = "Vertical split" } },
		{ "n", "s", "<C-w>s", opts = { desc = "Horizontal split" } },
		{ "n", "d", "<C-w>q", opts = { desc = "Close window" } },
	},
}

local leader_binds = {
	group = true,
	leader = "<leader>",
	desc = "Main leader binds",
	binds = {
		{ "n", ".", ":Ex<CR>", opts = { desc = "Open netrw"}},
		file_binds,
		git_binds,
		buffer_binds,
		telescope_binds,
		code_binds,
		quit_binds,
		window_binds,
	},
}

bindGroup("", leader_binds)

--- Buffer navigation
normalmap({ "H", ":bp<CR>" })
normalmap({ "L", ":bn<CR>" })
normalmap({ "<Esc>", ":noh<CR>" })

--- Flash.nvim
vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Tresitter jump" })
vim.keymap.set({ "o" }, "r", function()
	require("flash").remote()
end, { desc = "Tresitter jump" })
vim.keymap.set({ "o" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Tresitter jump" })
