local M = {}

-- local on_attach = function(client)
-- print(vim.inspect(client)) -- thats kinda useful
M.on_attach = function()
	local opts = { buffer = 0 }

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- hover
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- goto defenition
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts) -- goto type definition
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- goto implementation
	vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts) -- diagnostics down
	vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts) -- diagnostics up
	vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts) -- rename something
	vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts) -- vim code actions
	vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts) -- vim references
	vim.keymap.set("n", "<leader>vdl", "<cmd>Telescope diagnostics<CR>", opts) -- vim diagnostics list
end

--[[ M.capabilities = require("cmp_nvim_lsp").default_capabilities()
]]
M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

return M
