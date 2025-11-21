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

			local function map(mode, l, r, opts)
				opts = opts or {}
				vim.keymap.set(mode, l, r, opts)
			end

			map({ "i" }, "<C-K>", function()
				luasnip.expand()
			end)
			map({ "i", "s" }, "<C-L>", function()
				require("luasnip").jump(1)
			end)
			map({ "i", "s" }, "<C-J>", function()
				require("luasnip").jump(-1)
			end)
			map({ "i", "s" }, "<C-E>", function()
				local ls = require("luasnip")
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end)

			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
