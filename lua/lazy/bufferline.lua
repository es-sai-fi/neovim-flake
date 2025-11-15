return {
	"bufferline.nvim",
	event = { "BufReadPost", "ButNewFile" },
	keys = {
		{ "<leader>b1", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Buffer 1" },
		{ "<leader>b2", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Buffer 2" },
		{ "<leader>b3", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Buffer 3" },
		{ "<leader>b4", "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Buffer 4" },
		{ "<leader>b5", "<Cmd>BufferLineGoToBuffer 5<CR>", desc = "Buffer 5" },
		{ "<leader>b6", "<Cmd>BufferLineGoToBuffer 6<CR>", desc = "Buffer 6" },
		{ "<leader>b7", "<Cmd>BufferLineGoToBuffer 7<CR>", desc = "Buffer 7" },
		{ "<leader>b8", "<Cmd>BufferLineGoToBuffer 8<CR>", desc = "Buffer 8" },
		{ "<leader>b9", "<Cmd>BufferLineGoToBuffer 9<CR>", desc = "Buffer 9" },
	},
	after = function()
		local bufferline = require("bufferline")

		bufferline.setup()
	end,
}
