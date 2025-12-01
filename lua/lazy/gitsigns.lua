return {
	"gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			on_attach = function(buffer)
        -- stylua: ignore start
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, "Prev Hunk")
        map("n", "]H", function() gitsigns.nav_hunk("last") end, "Last Hunk")
        map("n", "[H", function() gitsigns.nav_hunk("first") end, "First Hunk")
        map({ "n", "x" }, "<leader>ghs", gitsigns.stage_hunk, "Stage Hunk")
        map({ "n", "x" }, "<leader>ghr", gitsigns.reset_hunk, "Reset Hunk")
        map("n", "<leader>ghS", gitsigns.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gitsigns.reset_buffer, "Undo Stage Hunk")
        map("n", "<leader>ghR", gitsigns.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gitsigns.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>ghb", function() gitsigns.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghB", function() gitsigns.blame() end, "Blame Buffer")
        map("n", "<leader>ghd", gitsigns.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gitsigns.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", gitsigns.select_hunk(), "GitSigns Select Hunk")
			end,
		})
	end,
}
