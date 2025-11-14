local opt = vim.opt

opt.confirm = true -- Ask for confirmation instead of erroring out
opt.hidden = true -- Allow switching buffers without saving
opt.autoread = true -- Auto-reload files changed outside of Neovim
opt.autowrite = true -- Auto-save before running commands like :next, :make, etc.
opt.clipboard = "unnamedplus" -- Use system clipboard for copy/paste
opt.mouse = "a" -- Enable mouse support
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.showmode = false -- Don’t show mode in the command line (statusline handles it)
opt.laststatus = 3 -- Global statusline (Neovim 0.7+)
opt.signcolumn = "yes" -- Always show the sign column (for LSP, Git, etc.)
opt.splitbelow = true -- Open horizontal splits below
opt.splitright = true -- Open vertical splits to the right
opt.splitkeep = "screen" -- Keep screen stable when splitting
opt.scrolloff = 8 -- Keep 8 lines visible above/below the cursor
opt.sidescrolloff = 8 -- Horizontal scroll margin
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Don’t wrap long lines
opt.linebreak = true -- Wrap at word boundaries (if wrap is enabled)
opt.wildmode = "longest:full,full" -- Better command-line completion
opt.confirm = true -- Confirm before closing modified buffers

opt.swapfile = false -- Don’t create swap files
opt.backup = false -- Disable backups
opt.writebackup = false -- Disable write backups
opt.undofile = true -- Persist undo history across sessions
opt.undolevels = 10000 -- Large undo history depth
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "folds" } -- What to save in sessions

opt.number = true -- Show absolute line numbers
opt.relativenumber = true -- Show relative line numbers
opt.cursorline = true -- Highlight the current line
opt.foldmethod = "indent" -- Fold based on indentation
opt.foldlevel = 99 -- Keep all folds open by default
opt.virtualedit = "block" -- Allow cursor past end of line in block mode
opt.conceallevel = 2 -- Hide markdown markup (keep substitutions visible)
opt.cmdheight = 1 -- Minimal command line height
opt.pumheight = 10 -- Max height for popup menu

opt.expandtab = true -- Convert tabs to spaces
opt.shiftwidth = 2 -- Number of spaces per indentation level
opt.tabstop = 2 -- Number of spaces that a <Tab> counts for
opt.smartindent = true -- Smart auto-indentation on new lines
opt.autoindent = true -- Copy indentation from current line
opt.shiftround = true -- Round indents to nearest multiple of shiftwidth

opt.ignorecase = true -- Case-insensitive search by default
opt.smartcase = true -- Be case-sensitive if search contains uppercase
opt.incsearch = true -- Show matches as you type
opt.hlsearch = true -- Highlight all search matches
opt.inccommand = "nosplit" -- Live preview of substitutions (:s)
opt.jumpoptions = "view" -- Keep cursor view when jumping
opt.grepformat = "%f:%l:%c:%m" -- Format for grep output
opt.grepprg = "rg --vimgrep" -- Use ripgrep for :grep if available

opt.updatetime = 250 -- Faster updates (useful for diagnostics, CursorHold)
opt.timeoutlen = 400 -- Shorter timeout for mapped sequences
opt.smoothscroll = true -- Enable smooth scrolling
opt.formatoptions:remove({ "c", "r", "o" }) -- Don’t auto-insert comment leaders

opt.completeopt = { "menu", "menuone", "noselect" } -- Better completion UX
opt.shortmess:append("c") -- Reduce completion messages

opt.scrolloff = 4 -- Keep context lines above/below cursor when scrolling
