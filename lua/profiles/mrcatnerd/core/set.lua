vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:block,o:block,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
-- TODO: commit to gh

vim.opt.mouse = "a"

-- TODO: make this work
--[[ vim.cmd("set guicursor=n:blinkon0")
vim.cmd("set guicursor=c:blinkon0")
vim.cmd("set guicursor=v:blinkon0") ]]

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
vim.opt.undodir = os.getenv("HOME") -- works on linux as well i think
	.. "/.vim/undodir" -- this won't work on normal (window) cmds, use powershell instead.
vim.opt.undofile = true
vim.env.VIMCONFIG = (function()
	if vim.loop.os_uname().sysname == "Windows_NT" then -- TODO: make more like that for other path and windows - linux stuff
		return vim.fn.expand("$LOCALAPPDATA/nvim")
	else
		return vim.fn.expand("~/.config/nvim")
	end
end)()

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
-- vim.opt.updatetime = 250

vim.opt.colorcolumn = "80"

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.g.mapleader = " "

-- stolen from nvchad

-- disable nvim intro
vim.opt.shortmess:append("sI")

-- dont list quickfix buffers
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf", "notify" },
	callback = function()
		vim.opt_local.buflisted = false
	end,
})

-- disable somoe default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- binaries installed by mason.nvim to PATH
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
