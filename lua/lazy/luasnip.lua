return {
	"LuaSnip",
	lazy = false,
	keys = {
		{
			"<C-K>",
			mode = { "i" },
			function()
				require("luasnip").expand()
			end,
			silent = true,
		},
		{
			"<C-L>",
			mode = { "i", "s" },
			function()
				require("luasnip").jump(1)
			end,
			silent = true,
		},
		{
			"<C-J>",
			mode = { "i", "s" },
			function()
				require("luasnip").jump(-1)
			end,
			silent = true,
		},
		{
			"<C-E>",
			mode = { "i", "s" },
			function()
				local ls = require("luasnip")
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end,
			silent = true,
		},
	},
	after = function()
		require("luasnip").setup()
	end,
}
