return { -- formatting
	"stevearc/conform.nvim",
	cmd = { "ConformInfo", "ConformWrite", "FormatWrite" },
	event = "BufWritePre",
	config = function()
		local format_on_save = true
		local lsp_format_on_save = false -- true: lsp format, false: conform.nvim

		vim.api.nvim_create_user_command("FormatWrite", function(_)
			if format_on_save then
				if lsp_format_on_save then
					vim.lsp.buf.format()
				else
					require("conform").format({ bufnr = vim.fn.winbufnr(0) })
				end
			end
		end, {})

		vim.api.nvim_create_user_command("ConformWrite", function(_)
			require("conform").format({ bufnr = vim.fn.winbufnr(0) })
		end, {})

		require("conform").setup({
			-- It will pass the table to conform.format().
			-- This can also be a function that returns the table.
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_fallback = true,
				timeout_ms = 500,
			},
			-- If this is set, Conform will run the formatter asynchronously after save.
			-- It will pass the table to conform.format().
			-- This can also be a function that returns the table.
			format_after_save = {
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "black" },
				-- Use a sub-list to run only the first available formatter
				javascript = { { "biome", "prettierd", "prettier" } },
				typescript = { { "biome", "prettierd", "prettier" } },

				rust = {
					{
						"clippy",
						"rustfmt",
					},
				},
				cpp = {
					"clang_format",
				},

				c = {
					"clang_format",
				},

				bash = {
					"shfmt",
				},
				csharp = {
					"clang_format",
				},

				json = {
					"biome",
				},
				_ = { "trim_whitespace" },
			},
		})
	end,
}
