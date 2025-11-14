return {
	"conform.nvim",
	event = { "BufWritePre" },
	config = function()
    local conform = require("conform")

		conform.setup({
      formatters_by_ft = {
			  lua = { "stylua" },
			  go = { "gofmt" },
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
  end,
}
