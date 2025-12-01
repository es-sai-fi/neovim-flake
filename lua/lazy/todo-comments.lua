return {
	"todo-comments.nvim",
	event = { "BufReadPost", "BufNewFile" },
	before = function()
		require("lz.n").trigger_load("plenary.nvim")
	end,
	keys = {
		{
			"<leader>st",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Todo",
		},
		{
			"<leader>sT",
			function()
				Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
			end,
			desc = "Todo/Fix/Fixme",
		},
	},
}
