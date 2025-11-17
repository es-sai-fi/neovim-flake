return {
	"lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		local lualine = require("lualine")

		lualine.setup({
			options = {
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				globalstatus = vim.o.laststatus == 3,
				disabled_filetypes = { statusline = { "snacks_dashboard" } },
			},
			extesions = { "oil" },
		})
	end,
}
