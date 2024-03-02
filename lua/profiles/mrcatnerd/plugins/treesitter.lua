return {
	"nvim-treesitter/nvim-treesitter",
	init = function()
		require("common.utils").lazy_load("nvim-treesitter")
	end,
	cmd = {
		"EditQuery",
		"Inspect",
		"InspectTree",
		"TSBufDisable",
		"TSBufEnable",
		"TSDisable",
		"TSEnable",
		"TSInstall",
		"TSModuleInfo",
		"TSUpdate",
		"TSUpdateSync",
	},
	build = ":TSUpdate",
	opts = {
		-- A list of parser names, or "all" (the five listed parsers should always be installed)
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"diff",
			"gdscript",
			"glsl",
			"go",
			"hlsl",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"rust",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
			"csv",
			"sql",
			"rasi",
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
			disable = function(_, bufnr)
				local buf_name = vim.api.nvim_buf_get_name(bufnr)
				local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
				return file_size > 256 * 1024
			end,
		},
	},
	config = function(_, opts)
		if not (vim.loop.os_uname().sysname == "Windows_NT") then
			-- require "nvim-treesitter.install".compilers = { "MSBuild" }
			require("nvim-treesitter.configs").setup(opts)
		end
	end,
}
