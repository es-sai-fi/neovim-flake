return {
	"gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			on_attach = function(bufnr)
				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Next Hunk", buffer = bufnr })
				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Prev Hunk", buffer = bufnr })
				map("n", "]H", function()
					gitsigns.nav_hunk("last")
				end, { desc = "Last Hunk", buffer = bufnr })
				map("n", "[H", function()
					gitsigns.nav_hunk("first")
				end, { desc = "First Hunk", buffer = bufnr })
				map({ "n", "x" }, "<leader>ghs", gitsigns.stage_hunk, { desc = "Stage Hunk", buffer = bufnr })
				map({ "n", "x" }, "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset Hunk", buffer = bufnr })
				map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "Stage Buffer", buffer = bufnr })
				map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "Reset Buffer", buffer = bufnr })
				map("n", "<leader>ghp", gitsigns.preview_hunk_inline, { desc = "Preview Hunk Inline", buffer = bufnr })
				map("n", "<leader>ghb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame Line", buffer = bufnr })
				map("n", "<leader>ghB", function()
					gitsigns.blame()
				end, { desc = "Blame Buffer", buffer = bufnr })
				map("n", "<leader>ghd", gitsigns.diffthis, { desc = "Diff This", buffer = bufnr })
				map("n", "<leader>ghD", function()
					gitsigns.diffthis("~")
				end, { desc = "Diff This ~", buffer = bufnr })
				map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "GitSigns Select Hunk", buffer = bufnr })
			end,
		})
	end,
}
