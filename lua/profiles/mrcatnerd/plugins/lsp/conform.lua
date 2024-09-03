--[[ -- TODO: y disable and enbale are not working
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
}) ]]

return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    event = "BufWritePre",

    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        notify_on_error = false,
        format_on_save = {
            lsp_fallback = "fallback",
            timeout_ms = 500,
        },
        formatters_by_ft = { -- bruh stop_after_first is annoying
            lua = { "stylua" },
            python = { "black", "isort", lsp_format = "fallback", stop_after_first = true },
            javascript = { { "biome", "prettierd", "prettier", lsp_format = "fallback", stop_after_first = true } },
            typescript = { { "biome", "prettierd", "prettier", lsp_format = "fallback", stop_after_first = true } },
            rust = { { "clippy", "rustfmt", lsp_format = "fallback", stop_after_first = true } },
            cpp = { "clang_format", lsp_format = "fallback" },
            c = { "clang_format", lsp_format = "fallback" },
            bash = { "shfmt", lsp_format = "fallback" },
            csharp = { "clang_format", lsp_format = "fallback" },
            json = { "biome", lsp_format = "fallback" },
            asm = { "asmfmt", lsp_format = "fallback" },
            gdscript = { "gdtoolkit", lsp_format = "fallback" },
            _ = { "trim_whitespace" }, -- Apply to all filetypes
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)

        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
