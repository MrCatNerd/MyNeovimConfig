return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.4",
	-- or                              , branch = "0.1.x",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build", -- cmake
		},

		"nvim-treesitter/nvim-treesitter", -- for preview highlighting

		-- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } -- make
	},
	extensions_list = { "themes", "terms", "fzf" },
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-a>"] = function()
						print("meow")
					end,
					--n = { ["q"] = require("telescope.actions").close },
				},
			},
			vimgrep_arguments = {
				"rg",
				"-L",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			prompt_prefix = "$ ",
			selection_caret = "> ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "bottom",
					preview_width = 0.55,
					results_width = 0.8,
				},
				vertical = {
					mirror = false,
				},
				width = 0.87,
				height = 0.80,
				preview_cutoff = 120,
			},
			file_ignore_patterns = { "node_modules" },
			winblend = 0,
			border = {},
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			color_devicons = true,
			set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		},
	},
	keys = {
		{
			"<leader>ps",
			function()
				require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
			end,
			desc = "projects search",
		},
		{ "<leader>pf", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
		{ "<C-p>", "<cmd>Telescope git_files<CR>", desc = "Telescope git files" },
		{ "<Tab>", "<cmd>Telescope help_tags<CR>", desc = "Telescope help tags (best thing ever)" },
		{
			"<leader>rr",
			function()
				require("telescope").extensions.refactoring.refactors()
			end,
			mode = { "n", "x" }, -- Note that not all refactor support both normal and visual mode
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")

		telescope.setup(opts)

		telescope.load_extension("fzf")
		telescope.load_extension("refactoring")
	end,
}
