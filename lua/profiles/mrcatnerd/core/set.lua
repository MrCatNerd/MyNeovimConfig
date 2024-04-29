-------------------------------------- globals -----------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-------------------------------------- options ------------------------------------------
vim.opt.laststatus = 3 -- global statusline
vim.opt.showmode = false

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:block25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175" -- dont worry 'bout it
vim.opt.mouse = "a"

vim.opt.number = false
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") -- works on linux as well i think
	.. "/.vim/undodir" -- this won't work on normal (window) cmds, use powershell instead.
vim.opt.undofile = true

if vim.fn.has("win32") ~= 0 then -- TODO: make more like that for other path and windows - linux stuff
	vim.env.VIMCONFIG = vim.fn.expand("$LOCALAPPDATA/nvim")
else
	vim.env.VIMCONFIG = vim.fn.expand("$HOME/.config/nvim")
end

vim.opt.hlsearch = false -- best option ever
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.splitbelow = true

-- Decrease update time
vim.opt.updatetime = 50
-- vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Sets how neovim will display certain whitespace in the editor.
--  See :help 'list'
--  and :help 'listchars'
vim.opt.list = false -- set to true te enable listchars
vim.opt.listchars = { trail = "·", nbsp = "␣" }

vim.opt.colorcolumn = "80"

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- vim.opt.shortmess:append("sIc")
vim.opt.shortmess:append("sI")

-- binaries installed by mason.nvim to PATH
local is_windows = vim.fn.has("win32") ~= 0
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
