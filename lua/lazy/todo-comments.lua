return {
	"todo-comments",
	event = { "BufReadPost", "BufNewFile" },
	before = function()
		local lzn = require("lz.n")

		lzn.trigger_load("plenary")
	end,
	after = function()
		require("todo-comments")
	end,
}
