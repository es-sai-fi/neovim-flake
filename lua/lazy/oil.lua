return {
	"oil.nvim",
	cmd = "Oil",
	keys = {
		{ "<leader>o", "<CMD>Oil<CR>", desc = "Toggle Oil" },
	},
	after = function()
		local oil = require("oil")

		oil.setup()
	end,
}
