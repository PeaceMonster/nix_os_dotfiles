require("lsp/lua")

local servers = {
	"clangd",
	"cssls",
	"emmet_language_server",
	"eslint",
	"elmls",
	"gleam",
	"gopls",
	"html",
	"jsonls",
	"markdown_oxide",
	"nixd",
	"ocamllsp",
	"pylsp",
	"rust_analyzer",
	"svelte",
	"tinymist",
	"ts_ls",
	"zls",
}

for _, server in pairs(servers) do
	vim.lsp.enable(server)
end
