return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstallAll", "MasonUpdate" },
	opts = { -- THX NVCHAD
		PATH = "skip",

		ui = {
			icons = {
				package_pending = " ",
				package_installed = "󰄳 ",
				package_uninstalled = " 󰚌",
			},

			-- keymaps = {
			--     toggle_server_expand = "<CR>",
			--     install_server = "i",
			--     update_server = "u",
			--     check_server_version = "c",
			--     update_all_servers = "U",
			--     check_outdated_servers = "C",
			--     uninstall_server = "X",
			--     cancel_installation = "<C-c>",
			-- },
		},

		max_concurrent_installers = 10,
	},
	config = function(_, opts)
		require("mason").setup(opts)

		local ensure_installed = {
			-- "csharp-language-server",
			-- "bash-language-server",
			-- "biome",
			"gdtoolkit",
			"typescript-language-server",
			"black",
			"clangd",
			"cmake-language-server",
			"gopls",
			"lua-language-server",
			"pyright",
			"rust-analyzer",
			"stylua",
			"glsl_analyzer",
		} -- not an option from mason.nvim (stolen from nvchad)

		-- custom cmd to install all mason binaries listed (Shamelessly stolen from NvChad)
		vim.api.nvim_create_user_command("MasonInstallAll", function()
			if ensure_installed and #ensure_installed > 0 then
				vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
			end
		end, {})

		vim.g.mason_binaries_list = ensure_installed
	end,
}
