-- This needs to be at top of your `init.lua`

require("profiles.mrcatnerd.core.set")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("profiles.mrcatnerd.core")
require("profiles.mrcatnerd.plugins")

require("profiles.mrcatnerd.plugins.ui.colors") -- not loading immediately so u might notice colorscheme changes (but it doest save some startuptime))
