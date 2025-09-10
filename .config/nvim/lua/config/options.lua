vim.g.mapleader = " "
vim.g.maplocalleader = " "
--vim.opt.guicursor = ""

-- LazyVim auto format
vim.g.autoformat = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.o.pumheight = 12
vim.o.autoread = true

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- hwlo world
opt.wrap = false
--
-- Enable spell checking
vim.opt.spell = true
-- Set language(s)
vim.opt.spelllang = { "en_us" } -- you can add more, e.g. { "en_us", "de" }

opt.swapfile = false -- Disables swap files
opt.backup = false -- Disables backup files

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false -- Disable highlighting of search results
opt.incsearch = true -- Enable incremental search (shows results as you type)
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.scrolloff = 8 -- Keeps at least 8 lines above/below the cursor
opt.signcolumn = "yes" -- Always show the sign column (prevents UI shifting)
opt.isfname:append("@-@") -- Allows "@" in filenames

opt.updatetime = 50

opt.colorcolumn = "80"
