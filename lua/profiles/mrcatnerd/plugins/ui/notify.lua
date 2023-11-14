return {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        notify.setup({
            background_colour = "#000000",
            render = "compact",
            stages = "fade_in_slide_out",
            top_down = true,
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                TRACE = "✎",
                WARN = "",
            },
        })

        vim.notify = notify

        -- notify("Shut down your computer to exit Vim", "warning") -- best line of code ever
    end,
}

