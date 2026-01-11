return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo", "ConformFormat", "ConformFormat", "ConformToggleFormatGlobal" },
    event = "BufWritePre",

    opts = {
        notify_on_error = false,
        format_on_save = {
            function(bufnr)
                -- Disable autoformat on certain filetypes
                local ignore_filetypes = { "sql", "java" }
                if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then return end
                -- Disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
                -- Disable autoformat for files in a certain path
                local bufname = vim.api.nvim_buf_get_name(bufnr)
                if bufname:match "/node_modules/" then return end
                -- ...additional logic...

                return { timeout_ms = 500, lsp_format = "fallback" }
            end,
        },
        formatters_by_ft = { -- bruh stop_after_first is annoying
            lua = { "stylua", lsp_format = "fallback" },
            python = { "ruff_format", lsp_format = "fallback", stop_after_first = true },
            javascript = { "biome", "prettierd", "prettier", lsp_format = "fallback", stop_after_first = true },
            typescript = { "biome", "prettierd", "prettier", lsp_format = "fallback", stop_after_first = true },
            rust = { "clippy", "rustfmt", lsp_format = "fallback", stop_after_first = true },
            cpp = { "clang_format", lsp_format = "fallback" },
            c = { "clang_format", lsp_format = "fallback" },
            bash = { "shfmt", lsp_format = "fallback" },
            csharp = { "clang_format", lsp_format = "fallback" },
            json = { "biome", lsp_format = "fallback" },
            asm = { "asmfmt", lsp_format = "fallback" },
            gdscript = { "gdtoolkit", lsp_format = "fallback" },
            _ = { "trim_whitespace" }, -- Apply to all filetypes
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)

        -- FIXME: fix both ConformToggleFormat and ConformToggleFormatGlobal cuz they aren't working and im too lazy to do any troubleshooting
        vim.api.nvim_create_user_command(
            "ConformToggleFormatGlobal",
            function(args) vim.g.disable_autoformat = not vim.g.disable_autoformat end,
            {}
        )

        vim.api.nvim_create_user_command("ConformToggleFormat", function(args)
            local bufnr = vim.api.nvim_get_current_buf()
            vim.b[bufnr].disable_autoformat = not vim.b[bufnr].disable_autoformat
        end, {})

        vim.api.nvim_create_user_command("ConformFormat", function(args)
            local range = nil
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line:len() },
                }
            end
            require("conform").format { async = true, lsp_format = "fallback", range = range }
        end, { range = true })

        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
