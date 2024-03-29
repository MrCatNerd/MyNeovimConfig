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
			"css",
			"csv",
			"diff",
			"dockerfile",
			"gdscript",
			"gitignore",
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
			"rasi",
			"regex",
			"rust",
			"sql",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
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
			highlight = { enable = true },

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
			disable = function(_, bufnr) -- Disable treesitter on big files
				local buf_name = vim.api.nvim_buf_get_name(bufnr)
				local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
				return file_size > 256 * 1024
			end,
		},
	},
	config = function(_, opts)
		if not vim.fn.has("win32") ~= 0 then
			require("nvim-treesitter.configs").setup(opts)
		end
	end,
}
