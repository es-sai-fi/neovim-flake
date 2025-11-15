return {
	"lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		local lualine = require("lualine")

		lualine.setup({
			options = {
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},
		})
	end,
}
