return {
	"lazydev.nvim",
	after = function()
		require("lazydev").setup({
			signature = { enabled = true },
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		})
	end,
}
