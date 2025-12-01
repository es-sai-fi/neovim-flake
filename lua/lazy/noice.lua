return {
	"noice.nvim",
	event = "DeferredUIEnter",
	before = function()
		local lzn = require("lz.n")

		lzn.trigger_load("nui.nvim")
		lzn.trigger_load("nvim-notify")
	end,
	after = function()
		require("noice").setup({
			routes = {
				{
					view = "notify",
					filter = { event = "msg_showmode" },
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = false },
				},
			},
		})
	end,
}
