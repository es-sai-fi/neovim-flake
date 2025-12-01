return {
	"nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			c = { "clangtidy" },
			cpp = { "clangtidy" },
			go = { "golangcilint" },
			rust = { "clippy" },
			python = { "ruff" },
			javascript = { "biomejs" },
			typescript = { "biomejs" },
			json = { "biomejs" },
			jsonc = { "biomejs" },
			html = { "biomejs" },
			css = { "biomejs" },
			nix = { "statix" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = augroup("lint"),
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
