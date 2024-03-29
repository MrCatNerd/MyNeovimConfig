-- TODO: y disable and enbale are not working
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
})

return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo", "ConformToggle" },
	event = "BufWritePre",
	opts = {
		notify_on_error = false,
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { { "biome", "prettierd", "prettier" } },
			typescript = { { "biome", "prettierd", "prettier" } },
			rust = { { "clippy", "rustfmt" } },
			cpp = { "clang_format" },
			c = { "clang_format" },
			bash = { "shfmt" },
			csharp = { "clang_format" },
			json = { "biome" },
			_ = { "trim_whitespace" }, -- Apply to all filetypes
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
