vim.keymap.set("n", "<leader>fh", function()
	require("snacks.picker").files({
		cwd = vim.fn.expand("~"),
	})
end, { desc = "Find Files (Home Dir)" })
