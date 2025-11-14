return {
	"nvim-lint",
	after = function()
    local lint = require("nvim-lint")

    lint.linters_by_ft = {
      lua = { "luacheck" },
      go = { "golangcilint" },
      rust = { "clippy" },
      python = { "ruff" },
      javascript = { "biome" },
      typescript = { "biome" },
      json = { "biome" },
      jsonc = { "biome" },
      html = { "biome" },
      css = { "biome" },
      nix = { "statix" },
    } 
  end,
}
