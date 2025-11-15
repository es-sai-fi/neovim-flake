return {
	"mini.pairs",
	event = { "BufWritePre", "BufNewFile" },
	after = function()
		require("mini.pairs").setup()
	end,
}
