return {
	"nvim-lspconfig",
	config = function()
		vim.lsp.enable("nil_ls")
		vim.lsp.enable("gopls")
		vim.lsp.enable("basedpyright")
		vim.lsp.enable("vtsls")
	end,
}
