return {
	"conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				go = { "gofumpt" },
				rust = { "rustfmt" },
				python = { "ruff_format" },
				javascript = { "biome" },
				typescript = { "biome" },
				json = { "biome" },
				jsonc = { "biome" },
				html = { "biome" },
				css = { "biome" },
				nix = { "alejandra" },
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_format = "fallback",
			},
		})

		map({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
