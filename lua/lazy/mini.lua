return {
	{
		"mini.pairs",
		event = { "BufWritePre", "BufNewFile" },
		after = function()
			require("mini.pairs").setup({})
		end,
	},

	{
		"mini.surround",
		after = function()
			require("mini.surround").setup({
				mappings = {
					add = "gsa",
					delete = "gsd",
					find = "gsf",
					find_left = "gsF",
					highlight = "gsh",
					replace = "gsr",
					update_n_lines = "gsn",
				},
			})
		end,
	},
}
