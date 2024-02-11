return {
	"nvim-treesitter/nvim-treesitter", -- TODO: treesitter-textobjects
	init = function()
		require("common.utils").lazy_load("nvim-treesitter")
	end,
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSEnable", "TSDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	opts = {
		-- A list of parser names, or "all" (the five listed parsers should always be installed)
		ensure_installed = {
			"javascript",
			"typescript",
			"rust",
			"python",
			"cpp",
			"c",
			"go",
			"glsl",
			"hlsl",
			"gdscript",
			"markdown",
			"lua",
			"vim",
			"vimdoc",
			"query",
		},

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
		auto_install = false,

		highlight = {
			enable = true,
			use_languagetree = true,
			indent = { enable = true },

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},
	},
	config = function(_, opts)
		if not (vim.loop.os_uname().sysname == "Windows_NT") then
			-- require "nvim-treesitter.install".compilers = { "MSBuild" }
			require("nvim-treesitter.configs").setup(opts)
		end
	end,
}
