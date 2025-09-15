-- A list of parser names
-- TODO: see if treesitter.install is the correct way
local ensure_installed = {
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
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    -- cmd = {
    --     "EditQuery",
    --     "Inspect",
    --     "InspectTree",
    --     "TSBufDisable",
    --     "TSBufEnable",
    --     "TSDisable",
    --     "TSEnable",
    --     "TSInstall",
    --     "TSModuleInfo",
    --     "TSUpdate",
    --     "TSUpdateSync",
    -- },
    build = ":TSUpdate",
    opts = {
        -- Directory to install parsers and queries to
        install_dir = vim.fn.stdpath "data" .. "/site",

        -- TODO: check if these are still valid for 'master' branch
        highlight = {
            enable = true,
            use_languagetree = true,
            indent = { enable = true },
            highlight = { enable = true },

            additional_vim_regex_highlighting = false,

            -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                return ok and stats and stats.size > max_filesize
            end,
        },
    },
    config = function(_, opts)
        local treesitter = require "nvim-treesitter"
        treesitter.setup(opts)
        treesitter.install(ensure_installed)
    end,
    enabled = vim.fn.has "win32" == 0,
}
