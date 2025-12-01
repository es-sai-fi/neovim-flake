return {
	"gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			on_attach = function(buffer)
				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Next Hunk" })
				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Prev Hunk" })
				map("n", "]H", function()
					gitsigns.nav_hunk("last")
				end, { desc = "Last Hunk" })
				map("n", "[H", function()
					gitsigns.nav_hunk("first")
				end, { desc = "First Hunk" })
				map({ "n", "x" }, "<leader>ghs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
				map({ "n", "x" }, "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
				map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
				map("n", "<leader>ghu", gitsigns.reset_buffer, { desc = "Undo Stage Hunk" })
				map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
				map("n", "<leader>ghp", gitsigns.preview_hunk_inline, { desc = "Preview Hunk Inline" })
				map("n", "<leader>ghb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame Line" })
				map("n", "<leader>ghB", function()
					gitsigns.blame()
				end, { desc = "Blame Buffer" })
				map("n", "<leader>ghd", gitsigns.diffthis, { desc = "Diff This" })
				map("n", "<leader>ghD", function()
					gitsigns.diffthis("~")
				end, { desc = "Diff This ~" })
				map({ "o", "x" }, "ih", gitsigns.select_hunk(), { desc = "GitSigns Select Hunk" })
			end,
		})
	end,
}
