return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lua",
		require("profiles.mrcatnerd.plugins.lsp.nvim-luasnip"),
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			mapping = {
				["<C-y>"] = cmp.mapping.confirm({
					select = true, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					behavior = cmp.ConfirmBehavior.Insert,
				}),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-space>"] = cmp.mapping.complete({
					select = true,
					behavior = cmp.ConfirmBehavior.Insert,
				}),
				-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
				-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
			},

			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users. TODO: fix that even though it's working
				end,
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},

			sources = cmp.config.sources({
				{ name = "nvim_lua", max_item_count = 40 }, -- nvim_lua automatically handles the enabling in lua files only
				{ name = "crates", max_item_count = 40 }, -- for rust
				{ name = "vim_dadbod_completion", max_item_count = 40 },

				{ name = "nvim_lsp", max_item_count = 30 },
				{ name = "luasnip", max_item_count = 5, option = { show_autosnippets = true } }, -- For luasnip users.
				{ name = "codeium", keyword_length = 2, max_item_count = 10 },
				{ name = "buffer", keyword_length = 3, max_item_count = 10 },
				{ name = "path", max_item_count = 15, keyword_length = 2 },
			}),

			experimental = {
				ghost_text = true,
			},
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "buffer", keyword_length = 3, max_item_count = 10 },
			}),
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path", keyword_length = 3, max_item_count = 15 },
			}, {
				{
					name = "cmdline",
					keyword_length = 3,
					max_item_count = 15,
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})

		cmp.setup.filetype({ "db", "sql", "mysql", "plsql", "sqlite3" }, {
			sources = {
				{ name = "vim_dadbod_completion" },
				{ name = "buffer" },
			},
		})
	end,
}
