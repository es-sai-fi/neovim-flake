return {
	"nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
  after = function()
    vim.lsp.enable("lua-language-server")
		vim.lsp.enable("nil_ls")
		vim.lsp.enable("gopls")
		vim.lsp.enable("basedpyright")
		vim.lsp.enable("vtsls")
	end,
}
