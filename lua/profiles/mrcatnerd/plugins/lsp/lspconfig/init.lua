return {
	"neovim/nvim-lspconfig",
	init = function()
		require("common.utils").lazy_load("nvim-lspconfig")
	end,
	config = function()
		local lspconfig = require("lspconfig")
		local utils = require("profiles.mrcatnerd.plugins.lsp.lspconfig.utils")
		local configs = require("profiles.mrcatnerd.plugins.lsp.lspconfig.configs")

		-- Go through all servers and apply the lspconfig configs
		-- Yea boiii first try
		for server, override in pairs(configs) do
			local config = vim.tbl_extend("force", {
				on_attach = utils.on_attach,
				capabilities = utils.capabilities,
				root_dir = vim.fn.getcwd,
			}, override or {})
			if lspconfig[server] ~= nil then
				pcall(lspconfig[server].setup, config)
			else
				vim.notify(server)
			end
		end
	end,
}
