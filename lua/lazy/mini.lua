return {
	{
		"mini.pairs",
		event = { "InsertEnter" },
		after = function()
			require("mini.pairs").setup({
				modes = { insert = true, command = true, terminal = true },
				mappings = {
					["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
					["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
					["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

					[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
					["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
					["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

					['"'] = {
						action = "closeopen",
						pair = '""',
						neigh_pattern = "[^\\].",
						register = { cr = false },
					},
					["'"] = {
						action = "closeopen",
						pair = "''",
						neigh_pattern = "[^%a\\].",
						register = { cr = false },
					},
					["`"] = {
						action = "closeopen",
						pair = "``",
						neigh_pattern = "[^\\].",
						register = { cr = false },
					},
				},
			})
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
