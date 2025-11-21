local function augroup(name)
	vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank", { clear = true }),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = augroup("auto_create_dir", { clear = true }),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

local full_screen = 191

-- default status column, simply 2 spaces
local statuscolumn = "%r"
-- status column if only one buffer is open
-- (full_screen - text width) / 2
local statuscolumn_wide = string.rep(" ", (full_screen - 100) / 2) .. statuscolumn

-- set default
vim.o.statuscolumn = statuscolumn

-- check window list count and adapt padding
vim.api.nvim_create_autocmd({
	"BufEnter",
	"BufWinEnter",
	"BufWinLeave",
	"WinEnter",
	"WinLeave",
	"WinResized",
	"VimResized",
}, {
	callback = function()
		local winwidth = vim.api.nvim_win_get_width(0)
		if winwidth > (full_screen / 2) then
			vim.o.statuscolumn = statuscolumn_wide
		else
			vim.o.statuscolumn = statuscolumn
		end
	end,
})
