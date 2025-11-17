return {
	"gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Next hunk" })

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Previous hunk" })

				-- Actions
				map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset hunk" })

				map("v", "<leader>ghs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage selected hunk" })

				map("v", "<leader>ghr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset selected hunk" })

				map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "Stage buffer" })
				map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "Reset buffer" })
				map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "Preview hunk" })
				map("n", "<leader>ghi", gitsigns.preview_hunk_inline, { desc = "Inline hunk preview" })

				map("n", "<leader>ghb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame line (full)" })

				map("n", "<leader>ghd", gitsigns.diffthis, { desc = "Diff against index" })

				map("n", "<leader>ghD", function()
					gitsigns.diffthis("~")
				end, { desc = "Diff against last commit" })

				map("n", "<leader>ghQ", function()
					gitsigns.setqflist("all")
				end, { desc = "Quickfix list (all hunks)" })

				map("n", "<leader>ghq", gitsigns.setqflist, { desc = "Quickfix list (file hunks)" })

				-- Toggles
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
				map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

				-- Text object
				map({ "o", "x" }, "gih", gitsigns.select_hunk, { desc = "Select hunk" })
			end,
		})
	end,
}
