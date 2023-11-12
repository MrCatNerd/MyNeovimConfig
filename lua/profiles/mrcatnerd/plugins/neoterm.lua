return {
    "itmecho/neoterm.nvim",
    event = "CmdlineEnter",
    keys = {
        { "<leader>tt", function() require("neoterm").toggle() end, desc = "Toggles terminal" },
        { "<leader>tr", function() require("neoterm").rerun() end,  desc = "Toggles terminal" },
        { "<leader>tR", function() require("neoterm").run() end,    desc = "Toggles terminal" },
    },
    cmd = {
        "NeotermOpen",
        "NeotermClose",
        "NeotermToggle",
        "NeotermRun",
        "NeotermRerun",
        "NeotermExit",
    },
    config = function()
        require("neoterm").setup({
            clear_on_run = true, -- run clear command before user specified commands
            mode = "vertical",   -- vertical/horizontal/fullscreen
            noinsert = false     -- disable entering insert mode when opening the neoterm window
        })
    end
}
