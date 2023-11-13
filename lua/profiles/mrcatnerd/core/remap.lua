vim.g.mapleader = " "

-- vim.keymap.set("nnew_filetype, "<leader>pv", vim.cmd.Vex)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- nice remaps:
vim.keymap.set({ "n", "v" }, "<leader>c", [["+c]])

-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- i dont really use it

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>fl", vim.lsp.buf.format)      -- lsp formatting
vim.keymap.set("n", "<leader>ff", "<cmd>ConformWrite<CR>") -- formatter.nvim formatting (better in my opinion)


vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>xx", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e $VIMCONFIG\\init.lua<CR>")

vim.keymap.set("n", "<leader>md", function()    -- mark/s delete
    local marks = vim.fn.input("clear marks: ") -- get marks

    if marks == "!" then
        vim.cmd(":delmarks!") -- clear all lowercase marks
        return
    end

    vim.cmd(string.format(":delmarks %s", marks)) -- clear mark/s
end, { silent = true })

vim.keymap.set("n", "<leader>mD", function()                  -- macro delete
    local macro_key = vim.fn.input("clear macro key: ")       -- get macro key

    vim.cmd(string.format(":silent let @%s = ''", macro_key)) -- clear macro key
end, { silent = true })

vim.keymap.set("n", "<leader><leader>", "<cmd>so<CR>")

-- file scrolling
vim.keymap.set("n", "<leader>e", "<C-^>")

-- help tags
vim.keymap.set("n", "<C-i>", "<cmd>Telescope help_tags<CR>")


-- terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])
vim.keymap.set("n", "<leader>tt", "<cmd>sp | terminal<CR>")

