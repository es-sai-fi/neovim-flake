return {
	"oil.nvim",
	lazy = false,
	before = function()
		require("lz.n").trigger_load("oil-git.nvim")
	end,
	after = function()
		local oil = require("oil")

		local function map(mode, l, r, opts)
			opts = opts or {}
			vim.keymap.set(mode, l, r, opts)
		end

		map("n", "<leader>e", oil.open, { desc = "Toggle Oil" })
		map("n", "<leader>E", oil.open_float, { desc = "Toggle Oil (Floating)" })
		map("n", "<leader>q", oil.close, { desc = "Close Oil" })

		-- helper function to parse output
		local function parse_output(proc)
			local result = proc:wait()
			local ret = {}
			if result.code == 0 then
				for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
					-- Remove trailing slash
					line = line:gsub("/$", "")
					ret[line] = true
				end
			end
			return ret
		end

		-- build git status cache
		local function new_git_status()
			return setmetatable({}, {
				__index = function(self, key)
					local ignore_proc = vim.system(
						{ "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
						{
							cwd = key,
							text = true,
						}
					)
					local tracked_proc = vim.system({ "git", "ls-tree", "HEAD", "--name-only" }, {
						cwd = key,
						text = true,
					})
					local ret = {
						ignored = parse_output(ignore_proc),
						tracked = parse_output(tracked_proc),
					}

					rawset(self, key, ret)
					return ret
				end,
			})
		end
		local git_status = new_git_status()

		-- Clear git status cache on refresh
		local refresh = require("oil.actions").refresh
		local orig_refresh = refresh.callback
		refresh.callback = function(...)
			git_status = new_git_status()
			orig_refresh(...)
		end

		oil.setup({
			default_file_explorer = true,
			columns = {
				"icon",
				"mtime",
			},
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = false,
				is_hidden_file = function(name, bufnr)
					local dir = require("oil").get_current_dir(bufnr)
					local is_dotfile = vim.startswith(name, ".") and name ~= ".."
					-- if no local directory (e.g. for ssh connections), just hide dotfiles
					if not dir then
						return is_dotfile
					end
					-- dotfiles are considered hidden unless tracked
					if is_dotfile then
						return not git_status[dir].tracked[name]
					else
						-- Check if file is gitignored
						return git_status[dir].ignored[name]
					end
				end,
			},
		})
	end,
}
