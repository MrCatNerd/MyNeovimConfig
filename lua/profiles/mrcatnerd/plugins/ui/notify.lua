return {
    "rcarriga/nvim-notify",
    -- event = "UIEnter",
    config = function()
        local notify = require "notify"
        notify.setup {
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
        }

        vim.notify = notify
    end,
}
