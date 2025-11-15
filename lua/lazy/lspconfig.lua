return {
	"nvim-lspconfig",
<<<<<<< HEAD
	after = function()
=======
	event = { "BufReadPre", "BufNewFile" },
  after = function()
>>>>>>> b88ba30066d4f075cfc3b2269ae5108fac0fb3e9
    vim.lsp.enable("lua-language-server")
		vim.lsp.enable("nil_ls")
		vim.lsp.enable("gopls")
		vim.lsp.enable("basedpyright")
		vim.lsp.enable("vtsls")
	end,
}
