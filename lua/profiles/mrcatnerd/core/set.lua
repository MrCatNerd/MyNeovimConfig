vim.opt.guicursor = ""
vim.opt.mouse = "a"

vim.opt.number = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. -- works on linux as well i think
    "/.vim/undodir"                    -- this won't work on normal (window) cmds, use powershell instead.
vim.opt.undofile = true

if vim.loop.os_uname().sysname == "Windows_NT" then -- TODO: make more like that for other path and windows - linux stuff
    vim.env.VIMCONFIG = vim.fn.expand("$LOCALAPPDATA/nvim")
else
    vim.env.VIMCONFIG = vim.fn.expand("~/.config/nvim")
end

vim.opt.hlsearch = false -- best option ever
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 2
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.splitbelow = true

vim.opt.timeout = true
vim.opt.timeoutlen = 1000

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.g.mapleader = " "
