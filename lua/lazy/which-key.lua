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
		require("which-key").setup({
			delay = 0,
			preset = "helix",
			spec = {
				{
					mode = { "n", "x" },
					{ "<leader><tab>", group = "tabs" },
					{ "<leader>s", group = "grep/search" },
					{ "<leader>p", group = "picker" },
					{ "<leader>f", group = "files/find" },
					{ "<leader>g", group = "git" },
					{ "<leader>gh", group = "hunks" },
					{ "<leader>u", group = "ui" },
					{ "<leader>y", group = "yazi" },
					{ "<leader>x", group = "diagnostics" },
					{ "<leader>c", group = "code" },
					{ "g", group = "goto" },
					{ "gs", group = "surround" },
					{
						"<leader>b",
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
