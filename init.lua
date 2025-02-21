-- This needs to be at top of your `init.lua`

require "profiles.mrcatnerd.core.set"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require "profiles.mrcatnerd.core"
require "profiles.mrcatnerd.plugins"

vim.defer_fn(function()
    require("notify").notify("💀 Shut down your computer to exit Vim", "info") -- best line of code ever
end, 3500)

vim.defer_fn(require("profiles.mrcatnerd.plugins.ui.colors").ColorMyPencils, 100)
