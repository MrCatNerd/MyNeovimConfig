return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2", -- TODO: remove this line of code when they merge
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
		},
		{
			"<C-e>",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
		},
		{
			"<C-h>",
			function()
				require("harpoon"):list():select(1)
			end,
		},
		{
			"<C-t>",
			function()
				require("harpoon"):list():select(2)
			end,
		},
		{
			"<C-n>",
			function()
				require("harpoon"):list():select(3)
			end,
		},
		{
			"<C-s>",
			function()
				require("harpoon"):list():select(4)
			end,
		},
		-- Toggle previous & next buffers stored within Harpoon list
		{
			"<C-S-P>",
			function()
				require("harpoon"):list():prev()
			end,
		},
		{
			"<C-S-N>",
			function()
				require("harpoon"):list():next()
			end,
		},
	},
	opts = {},
	config = function(_, opts)
		require("harpoon"):setup(opts)
	end,
}
