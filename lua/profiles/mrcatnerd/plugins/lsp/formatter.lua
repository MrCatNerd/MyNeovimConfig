-- formatting

local format_on_save = true
local lsp_format_on_save = true -- true: lsp format, false: formatter.nvim

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function()
        if format_on_save then
            if lsp_format_on_save then
                vim.lsp.buf.format()
            else
                vim.cmd("<cmd>silent FormatWrite<CR>")
            end
        end
    end,
})

return {
    "mhartington/formatter.nvim",
    event = "BufWritePre",

    config = function()
        -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
        require("formatter").setup({
            -- Enable or disable logging
            logging = true,

            -- Set the log level
            log_level = vim.log.levels.WARN,
            -- All formatter configurations are opt-in
            filetype = {
                -- Formatter configurations for filetype "lua" go here
                -- and will be executed in order

                rust = {
                    require("formatter.filetypes.rust").rustfmt,
                },

                python = {
                    require("formatter.filetypes.python").black,
                },

                bash = {
                    require("formatter.filetypes.sh").shfmt,
                },

                lua = {
                    require("formatter.filetypes.lua").stylua,
                },

                cpp = {
                    require("formatter.filetypes.cpp").clang_format,
                },

                c = {
                    require("formatter.filetypes.c").clang_format,
                },

                csharp = {
                    require("formatter.filetypes.cs").clang_format,
                },

                json = {
                    require("formatter.filetypes.json").biome,
                },

                javascript = {
                    require("formatter.filetypes.javascript").biome,
                },

                typescript = {
                    require("formatter.filetypes.typescript").biome,
                },

                -- Use the special "*" filetype for defining formatter configurations on
                -- any filetype
                ["*"] = {
                    -- "formatter.filetypes.any" defines default configurations for any
                    -- filetype
                    require("formatter.filetypes.any").remove_trailing_whitespace,
                },
            },
        })
    end
}
