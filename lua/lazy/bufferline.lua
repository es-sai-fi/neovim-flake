return {
	"bufferline.nvim",
	event = { "UIEnter" },
	after = function()
		local bufferline = require("bufferline")

		bufferline.setup()
	end,
}
