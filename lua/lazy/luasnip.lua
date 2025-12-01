return {
	{
		"friendly-snippets",
	},
	{
		"luasnip",
		event = { "InsertEnter" },
		before = function()
			require("lz.n").trigger_load("friendly-snippets")
		end,
		after = function()
			local luasnip = require("luasnip")

			map({ "i" }, "<C-K>", function()
				luasnip.expand()
			end)
			map({ "i", "s" }, "<C-L>", function()
				luasnip.jump(1)
			end)
			map({ "i", "s" }, "<C-J>", function()
				luasnip.jump(-1)
			end)
			map({ "i", "s" }, "<C-E>", function()
				if luasnip.choice_active() then
					luasnip.change_choice(1)
				end
			end)

			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
