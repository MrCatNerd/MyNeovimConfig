return {
    "ThePrimeagen/harpoon",
    keys = {
        { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>",        desc = "Add a file to harpoon list" },
        { "<C-e>",     "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Toggles harpoon quick menu" },
        { "<C-h>",     "<cmd>lua require('harpoon.ui').nav_file(1)<CR>",         desc = "Warps to harpoon nav file 1" },
        { "<C-t>",     "<cmd>lua require('harpoon.ui').nav_file(2)<CR>",         desc = "Warps to harpoon nav file 2" },
        { "<C-n>",     "<cmd>lua require('harpoon.ui').nav_file(3)<CR>",         desc = "Warps to harpoon nav file 3" },
        { "<C-s>",     "<cmd>lua require('harpoon.ui').nav_file(4)<CR>",         desc = "Warps to harpoon nav file 4" },
    },
}

