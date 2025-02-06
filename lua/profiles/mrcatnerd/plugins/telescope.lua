return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- or
    -- branch ="0.1.x",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",

        "nvim-treesitter/nvim-treesitter", -- for preview highlighting

        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            -- `cond` is a condition used to determine whether this plugin should be
            -- installed and loaded.
            cond = function() return vim.fn.executable "make" == 1 end,
        },
        --[[ {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build", -- cmake
            -- `cond` is a condition used to determine whether this plugin should be
            -- installed and loaded.
            cond = function() return vim.fn.executable "cmake" == 1 end,
        }, ]]
    },
    -- extensions_list = { "themes", "terms", "fzf" },
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
                    ["<C-a>"] = function() print "meow" end,
                    ["<esc>"] = function(...) require("telescope.actions").close(...) end,
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
            file_ignore_patterns = { "node_modules", "__pycache__", ".git" },
            winblend = 0,
            color_devicons = true,
            set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
            -- border = {},
            -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
    },
    keys = {
        {
            "<leader>ps",
            function() require("telescope.builtin").grep_string { search = vim.fn.input "Grep > " } end,
            desc = "projects search",
        },
        { "<leader>pf", function() require("telescope.builtin").find_files() end, desc = "Telescope find files" },
        { "<C-p>", function() require("telescope.builtin").git_files() end, desc = "Telescope git files" },
        { "<leader>vh", function() require("telescope.builtin").help_tags() end, desc = "Telescope help tags (best thing ever)" },
        {
            "<leader>rr",
            function() require("telescope").extensions.refactoring.refactors() end,
            mode = { "n", "x" }, -- Note that not all refactor support both normal and visual mode
        },
    },
    config = function(_, opts)
        local telescope = require "telescope"
        telescope.setup(opts)

        pcall(telescope.load_extension, "fzf")
        pcall(telescope.load_extension, "ui-select")
        pcall(telescope.load_extension, "refactoring")
    end,
}
