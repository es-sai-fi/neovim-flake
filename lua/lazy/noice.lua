return {
	"noice.nvim",
	event = "DeferredUIEnter",
	before = function()
		local lzn = require("lz.n")

		lzn.trigger_load("nui.nvim")
		lzn.trigger_load("nvim-notify")
	end,
	after = function()
		local noice = require("noice")

		noice.setup({
			presets = {
				command_palette = false,
			},
		})
	end,
}
