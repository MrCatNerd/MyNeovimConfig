return {
	"ThePrimeagen/harpoon",
	-- TODO: wait for harpoon 2 to not be kinda broken lol
	-- dependencies = { "nvim-lua/plenary.nvim" },

	keys = {
		{ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = "Add a file to harpoon list" },
		{ "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Toggles harpoon quick menu" },
		{ "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", desc = "Warps to harpoon nav file 1" },
		{ "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", desc = "Warps to harpoon nav file 2" },
		{ "<C-n>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", desc = "Warps to harpoon nav file 3" },
		{ "<C-s>", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", desc = "Warps to harpoon nav file 4" },
	},
	--[[ keys = {
		{ "<leader>a", function() require("harpoon"):list():add() end, },
		{ "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, },
		{ "<C-h>", function() require("harpoon"):list():select(1) end, },
		{ "<C-t>", function() require("harpoon"):list():select(2) end, },
		{ "<C-n>", function() require("harpoon"):list():select(3) end, },
		{ "<C-s>", function() require("harpoon"):list():select(4) end, },
		-- Toggle previous & next buffers stored within Harpoon list
		{ "<C-S-P>", function() require("harpoon"):list():prev() end, },
		{ "<C-S-N>", function() require("harpoon"):list():next() end, },
	},
	opts = {
		save_on_toggle = true,
		sync_on_ui_close = true,
		settings = {
			save_on_toggle = true,
			sync_on_ui_close = true,
		},
	},
	config = function(_, opts)
		require("harpoon"):setup(opts)
	end, ]]
}
