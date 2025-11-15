return {
	"oil.nvim",
	lazy = false,
	keys = {
		{ "<leader>o", "<CMD>Oil<CR>", desc = "Toggle Oil" },
	},
	after = function()
		local oil = require("oil")

		require("oil").setup()
	end,
}
