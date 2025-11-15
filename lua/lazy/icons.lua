return {
	{
		"nvim-web-devicons",
		after = function()
			require("nvim-web-devicons").setup({})
		end,
	},
	{
		"mini.icons",
		after = function()
			require("mini.icons").setup({})
		end,
	},
}
