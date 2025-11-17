return {
	"todo-comments.nvim",
	event = { "BufReadPost", "BufNewFile" },
	before = function()
		require("lz.n").trigger_load("plenary")
	end,
}
