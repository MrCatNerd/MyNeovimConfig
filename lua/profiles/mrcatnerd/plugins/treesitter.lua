return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    event = { "BufReadPost", "BufNewFile" },
    cmd = {
        "EditQuery",
        "Inspect",
        "InspectTree",
        "TSInstall",
        "TSInstallFromGrammar",
        "TSUninstall",
        "TSLog",
    },
    build = ":TSUpdate",
    opts = {
        -- Directory to install parsers and queries to
        install_dir = vim.fn.stdpath "data" .. "/site",

        -- A list of parser names
        ensure_installed = {
            "asm",
            "bash",
            "c",
            "c_sharp",
            "cmake",
            "commonlisp",
            "cpp",
            "css",
            "csv",
            "diff",
            "dockerfile",
            "gdscript",
            "gdshader",
            "gitignore",
            "glsl",
            "go",
            "hlsl",
            "html",
            "java",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
            "kotlin",
            "lua",
            "luadoc",
            "luap",
            "make",
            "markdown",
            "markdown_inline",
            "meson",
            "nix",
            "python",
            "query",
            "rasi",
            "regex",
            "rust",
            "sql",
            "tmux",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "<filetype>" },
            callback = function()
                if vim.treesitter.get_parser(nil, nil, { error = false }) then vim.treesitter.start() end
            end,
        })
    end,
    config = function(_, opts)
        -- ensure_installed is no longer part of nvim-treesitter, so we must extract it manually.
        local ensure_installed = opts.ensure_installed
        opts.ensure_installed = nil

        local nvim_treesitter = require "nvim-treesitter"
        nvim_treesitter.setup(opts)
        nvim_treesitter.install(ensure_installed):await(function(err)
            if err then
                vim.notify("Failed to install TreeSitter parsers: " .. err, vim.log.levels.WARN)
                return
            end
            -- start treesitter for all possible buffers
            -- not all buffers will be possible, so we will pcall this for best effort.
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                pcall(vim.treesitter.start, buf)
            end
        end)
    end,
    enabled = vim.fn.has "win32" == 0,
}
