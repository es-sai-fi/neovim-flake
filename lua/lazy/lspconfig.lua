return {
	"nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	before = function()
		local lzn = require("lz.n")

		lzn.trigger_load("blink")
	end,
	after = function()
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("nil_ls")
		vim.lsp.enable("gopls")
		vim.lsp.enable("basedpyright")
		vim.lsp.enable("ts_ls")
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})
	end,
}
