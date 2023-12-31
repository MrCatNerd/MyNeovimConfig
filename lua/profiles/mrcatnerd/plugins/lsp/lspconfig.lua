return {
	"neovim/nvim-lspconfig",
	init = function()
		require("common.utils").lazy_load("nvim-lspconfig")
	end,
	config = function()
		local lspconfig = require("lspconfig")

		local on_attach = function()
			local opts = { buffer = 0 }

			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- hover
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- goto defenition
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts) -- goto type definition
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- goto implementation
			vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts) -- diagnostics down
			vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts) -- diagnostics up
			vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts) -- rename something
			vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts) -- vim code actions
			vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts) -- vim references
			vim.keymap.set("n", "<leader>vdl", "<cmd>Telescope diagnostics<CR>", opts) -- vim diagnostics list
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- local capabilities = vim.lsp.protocol.make_client_capabilities()

		capabilities.textDocument.completion.completionItem = {
			documentationFormat = { "markdown", "plaintext" },
			snippetSupport = true,
			preselectSupport = true,
			insertReplaceSupport = true,
			labelDetailsSupport = true,
			deprecatedSupport = true,
			commitCharactersSupport = true,
			tagSupport = { valueSet = { 1 } },
			resolveSupport = {
				properties = {
					"documentation",
					"detail",
					"additionalTextEdits",
				},
			},
		}

		-- idk why this aint working

		-- lspconfig.tsserver.setup({
		--     on_attach = on_attach,
		--     capabilities = capabilities,
		--     root_dir = function()
		--         return vim.fn.getcwd()
		--     end,
		-- })

		-- lspconfig.sqlls.setup({
		--     on_attach = function()
		--         on_attach()
		--     end,
		--     capabilities = capabilities,
		--     root_dir = function()
		--         return vim.fn.getcwd()
		--     end,
		--     settings = {},
		-- })

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = function()
				return vim.fn.getcwd()
			end,

			settings = {
				Lua = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					autoImportCompletions = false,
					reportMissingImports = true,
					diagnostics = {
						globals = { "vim" },
					},
					format = {
						defaultConfig = {
							indent_style = "space",
							indent_size = 2,
						},
					},
					runtime = {
						-- Tell the language server which version of Lua you"re using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						userThirdParty = true,
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
							[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
							vim.env.VIMRUNTIME,
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
						followImportForHints = true,
					},
				},
			},
		})

		lspconfig.gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = function()
				return vim.fn.getcwd()
			end,
		})

		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "rustup", "run", "stable", "rust-analyzer" },
			settings = {
				rust_analyzer = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					autoImportCompletions = false,
					reportMissingImports = true,
					followImportForHints = true,

					imports = {
						granularity = {
							group = "module",
						},
						prefix = "self",
					},

					cargo = {
						buildScripts = {
							enable = true,
						},
						allFeatures = true,
					},

					procMacro = {
						enable = true,
					},

					checkOnSave = {
						command = "cargo clippy",
					},

					cachePriming = { -- enable caching
						enable = true,
					},
				},
			},
		})

		lspconfig.clangd.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = function()
				return vim.fn.getcwd()
			end,

			filetypes = { "c", "cpp" },

			settings = {
				msvc = {
					compilationDatabasePath = "<path-to-your-compilation-database>",
					clangdFileStatus = true,
					usePlaceholders = true,
					buildDirectory = "<path-to-your-build-directory>",
					resourceDirectory = "<path-to-your-resource-directory>",
				},
				clangd = {
					completeUnimported = true,
					fallbackFlags = {},
					showOrigins = true,
					useFallbackFlags = true,
					trace = { server = "verbose" },
					analysis = {
						useLibraryCodeForTypes = true,
						autoSearchPaths = true,
						autoImportCompletions = false,
						reportMissingImports = true,
						followImportForHints = true,
					},
				},
			},
		})

		lspconfig.pyright.setup({
			on_attach = function(client)
				client.server_capabilities.signetureHelpProvider = false
				on_attach()
			end,
			capabilities = capabilities,
			root_dir = function()
				return vim.fn.getcwd()
			end,

			settings = {
				python = {
					analysis = {
						typeCheckingMode = "normal",
						useLibraryCodeForTypes = true,
						autoSearchPaths = true,
						autoImportCompletions = false,
						reportMissingImports = true,
						followImportForHints = true,
						reportGeneralTypeIssues = true,
						analyzeUnannotatedFunctions = true,
						reportDeprecated = true,
					},
				},
			},
		})
	end,
}
