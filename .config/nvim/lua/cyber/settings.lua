--vim.opt.guicursor = ""

-- LazyVim auto format
vim.g.autoformat = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false

opt.swapfile = false  -- Disables swap files
opt.backup = false    -- Disables backup files

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false   -- Disable highlighting of search results
opt.incsearch = true   -- Enable incremental search (shows results as you type)
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.scrolloff = 8       -- Keeps at least 8 lines above/below the cursor
opt.signcolumn = "yes"  -- Always show the sign column (prevents UI shifting)
opt.isfname:append("@-@") -- Allows "@" in filenames

opt.updatetime = 50

opt.colorcolumn = "80"

vim.g.mapleader = " "
