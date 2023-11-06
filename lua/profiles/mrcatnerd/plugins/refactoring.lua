return {
    "ThePrimeagen/refactoring.nvim",
    event = "BufRead",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("refactoring").setup()

        vim.api.nvim_set_keymap("v", "<leader>ri",
            [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
            { noremap = true, silent = true, expr = false })
    end,
    enabled = function() -- treesitter is trash in windows :(
        return not (vim.loop.os_uname().sysname == "Windows_NT")
    end
}
