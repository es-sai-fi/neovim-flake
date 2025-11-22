return {
	"virt-column.nvim",
	event = { "BufReadPost", "BufNewFile" },
	after = function()
		require("virt-column").setup({
			char = { "│" },
			virtcolumn = "80",
			highlight = { "NonText" },
		})
	end,
}
