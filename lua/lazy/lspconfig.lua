return {
	"nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	before = function()
		local lzn = require("lz.n")

		lzn.trigger_load("blink.cmp")
	end,
	after = function()
		vim.lsp.enable("lua-language-server")
		vim.lsp.enable("nil_ls")
		vim.lsp.enable("gopls")
		vim.lsp.enable("basedpyright")
		vim.lsp.enable("vtsls")
	end,
}
