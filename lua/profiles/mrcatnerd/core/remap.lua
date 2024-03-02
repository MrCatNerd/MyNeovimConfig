vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Vex, { desc = "Opens Netrw vsplitted" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Opens Netrw" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves selected line/s down with movement keys" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves selected line/s up with movement keys" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "=ap", "mz=ap`z", { desc = "Auto ident paragraph (no lsp) and stay on same position" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste motion (p) to void register" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank motion (y) to void register" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank until end of line motion (Y) to void register" })

vim.keymap.set({ "n", "v" }, "<leader>c", [["+c]], { desc = "Change motion (c) to void register" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delte motion (d) to void register" }) -- i dont really use it

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set(
	"i",
	"<S-CR>",
	"<C-o>O",
	{ desc = "Insert newline behind the cursor", noremap = true, silent = true, expr = false }
)

vim.keymap.set(
	"i",
	"<C-CR>",
	"<C-o>o",
	{ desc = "Insert newline after the cursor", noremap = true, silent = true, expr = false }
)

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>fl", vim.lsp.buf.format, { desc = "Formats current file with LSP" }) -- lsp formatting
vim.keymap.set("n", "<leader>ff", "<cmd>ConformWrite<CR>", { desc = "Formats current file with Conform.nvim" }) -- formatter.nvim formatting (better in my opinion)

vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Find and replace only in current file (no LSP)" }
)

vim.keymap.set("n", "<leader><leader>", "<cmd>so<CR>", { desc = "Source remap" })

vim.keymap.set("n", "<leader>e", "<C-^>", { desc = "Alternate file remap cuz I have a - 100% keyboard" })

-- terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Escape Escape exits terminal mode" })
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { desc = "Exits terminal mode" })

-- quickfix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Next location list item" })
-- vim.keymap.set("n", "<leader>vpp", "<cmd>e $VIMCONFIG<CR>", { desc = "Go to neovim config" }) -- i dont really use that

-- mostly on linux
vim.keymap.set(
	"n",
	"<leader>xx",
	"<cmd>!chmod +x %<CR>",
	{ silent = true, desc = "Change execution permission to allow file execution" }
)

-- macros and marks
vim.keymap.set("n", "<leader>md", function() -- mark/s delete
	local marks = vim.fn.input("clear marks: ") -- get marks

	if marks == "!" then
		vim.cmd(":silent delmarks!") -- clear all lowercase marks
		return
	end

	vim.cmd(string.format(":silent delmarks %s", marks)) -- clear mark/s
end, { silent = true, desc = "Delte a mark or all lowercase marks" })

vim.keymap.set("n", "<leader>mD", function() -- macro delete
	local macro_key = vim.fn.input("clear macro key: ") -- get macro key

	vim.cmd(string.format(":silent let @%s = ''", macro_key)) -- clear macro key
end, { silent = true, desc = "Delete a macro" })
