return {
	-- best plugin ever
	{
		"tjdevries/sPoNGe-BoB.NvIm",
		cmd = {
			"SpOnGeBoBtOgGlE",
			"SpOnGeBoBeNaBlE",
			"SpOnGeBoBdIsAbLe",
			"SpOnGeBoBiFy",
		},
	},

	{
		"tikhomirov/vim-glsl",
		ft = "glsl",
		enabled = vim.fn.has("win32") ~= 0, -- because treesitter isnt working for windows
	},

	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gcc", mode = "n", desc = "Comment toggle current line" },
			{ "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
			{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
			{ "gbc", mode = "n", desc = "Comment toggle current block" },
			{ "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
			{ "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
		},
		config = function()
			require("Comment").setup()
		end,
	},

	-- other
	{
		"mbbill/undotree",
		cmd = {
			"UndotreeToggle",
			"UndotreeShow",
			"UndotreeHide",
			"UndotreeFocus",
			"UndotreePersistUndo",
		},
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggles undotree" },
		},
	},

	-- stupid stuff / maliciousness / other
	{ "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },

	--[[ {
        -- "MrCatNerd/temp.nvim",
        "temp.nvim",
        dev = true,
        dependencies = "nvim-lua/plenary.nvim",
        keys = { -- best thing ever
            { "<leader>www", "<cmd>TempToggle<CR>", desc = "Toggles temp.nvim menu" },
        },
        cmd = { "TempToggle", "DBG" },
        config = function()
            require("temp").setup()
        end,
    }, ]]

	{
		"MrCatNerd/temp.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		keys = { -- best thing ever
			{ "<leader>www", "<cmd>TempToggleMenu<CR>", desc = "Toggles temp.nvim menu" },
		},
		cmd = "TempToggleMenu",
	},

	{
		"folke/persistence.nvim",
		event = "BufReadPost", -- this will only start session saving when an actual file was opened
		opts = {
			-- add any custom options here
		},
	},
}
