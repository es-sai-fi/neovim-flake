return {
	"trouble.nvim",
	event = { "BufReadPre", "BufNewFile" },
	before = function()
		local lzn = require("lz.n")

		lzn.trigger_load("icons")
	end,
	after = function()
		local trouble = require("trouble")

		trouble.setup({})
	end,
}
