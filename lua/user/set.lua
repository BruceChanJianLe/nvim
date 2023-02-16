-- use fat cursor
vim.opt.guicursor = ""

-- use relativenumber
vim.opt.nu = true
vim.opt.relativenumber = true

-- setup tab size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- use vim indent
vim.opt.smartindent = true

-- no wrap for long lines
vim.opt.wrap = false

-- let undotree handle history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- incremental highlight search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- use terminal color
vim.opt.termguicolors = true

-- always 8 lines above or below while scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- fast update time
vim.opt.updatetime = 50

-- highlight column 80
vim.opt.colorcolumn = "80"