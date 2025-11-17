local disabled_builtins = {
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"matchit",
	"matchparen",
	"logiPat",
	"rrhelper",
	"netrw",
	"netrwPlugin",
	"tutor",
	"spellfile_plugin",
	"editorconfig",
}

for _, plugin in ipairs(disabled_builtins) do
	vim.g["loaded_" .. plugin] = 1
end

vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opt = vim.opt

opt.confirm = true
opt.hidden = true
opt.autoread = true
opt.autowrite = true
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.termguicolors = true
opt.showmode = false
opt.showcmd = true
opt.laststatus = 3
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.winminwidth = 5
opt.wrap = false
opt.linebreak = true
opt.wildmode = "longest:full,full"
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.undolevels = 10000
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "folds" }
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.virtualedit = "block"
opt.conceallevel = 2
opt.cmdheight = 1
opt.pumheight = 10
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.autoindent = true
opt.shiftround = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.inccommand = "nosplit"
opt.jumpoptions = "view"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.updatetime = 250
opt.timeoutlen = 400
opt.smoothscroll = true
opt.formatoptions:remove({ "c", "r", "o" })
opt.completeopt = { "menu", "menuone", "noselect" }
opt.shortmess:append("c")
opt.scrolloff = 4
opt.hidden = false
