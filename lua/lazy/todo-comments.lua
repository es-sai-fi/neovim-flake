return {
	"todo-comments",
	event = { "BufReadPost", "ButNewFile" },
	before = function()
		local lzn = require("lz.n")

		lzn.trigger_loard("plenary")
	end,
	after = function()
		require("todo-comments").setup({})
	end,
}
