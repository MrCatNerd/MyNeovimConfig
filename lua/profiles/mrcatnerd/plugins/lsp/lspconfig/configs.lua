local utils = require("profiles.mrcatnerd.plugins.lsp.lspconfig.utils")

return {
	["gopls"] = {},

	["clangd"] = {
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
	},

	["pyright"] = {
		on_attach = function(client)
			client.serverCapabilities.signatureHelpProvider = false
			utils.on_attach()
		end,
		settings = {
			python = {
				analysis = {
					diagnosticMode = "workspace",
					typeCheckingMode = "basic",
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
	},

	["rust_analyzer"] = {
		root_dir = nil, -- rust analyzer detects automatically i think
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
	},

	["lua_ls"] = {
		settings = {
			Lua = {
				useLibraryCodeForTypes = true,
				autoSearchPaths = true,
				-- autoImportCompletions = false,
				-- reportMissingImports = true,
				diagnostics = {
					globals = { "vim" },
				},
				format = {
					defaultConfig = {
						indent_style = "space",
						indent_size = 4,
					},
				},
				runtime = {
					-- Tell the language server which version of Lua you're using
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
	},
}
