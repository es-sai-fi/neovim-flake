return {
	"which-key.nvim",
	lazy = false,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Keymaps (which-key)",
		},
	},
	after = function()
		local wk = require("which-key")

		wk.setup({
			delay = 0,
			preset = "helix",
			spec = {
				{
					mode = { "n", "x" },
					{ "<leader><tab>", group = "tabs" },
					{ "<leader>s", group = "grep/search" },
					{ "<leader>p", group = "picker" },
					{ "<leader>f", group = "file/find" },
					{ "<leader>g", group = "git" },
					{ "<leader>u", group = "ui" },
					{ "<leader>y", group = "yazi" },
					{ "g", group = "goto" },
					{ "gs", group = "surround" },
					{
						"<lead>b",
						group = "buffer",
						expand = function()
							return require("which-key.extras").expand.buf()
						end,
					},
					{
						"<leader>w",
						group = "windows",
						proxy = "<c-w>",
						expand = function()
							return require("which-key.extras").expand.win()
						end,
					},
					{ "gx", desc = "Open with system app" },
				},
			},
		})
	end,
}
