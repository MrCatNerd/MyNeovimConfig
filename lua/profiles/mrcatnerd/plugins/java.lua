return { -- :(
	"https://github.com/mfussenegger/nvim-jdtls",
	event = "BufRead *.java",
	config = function()
		local home = os.getenv("HOME")
		local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = workspace_path .. project_name

		local status, jdtls = pcall(require, "jdtls")
		if not status then
			return
		end
		local extendedClientCapabilities = jdtls.extendedClientCapabilities

		local function get_config_dir()
			local uname = vim.loop.os_uname()
			local os = uname.sysname:lower()
			local arch = uname.machine

			local config_dir = "config_"

			if os == "linux" then
				config_dir = config_dir .. "linux"
			elseif os == "darwin" then
				config_dir = config_dir .. "mac"
			elseif os == "windows" then
				config_dir = config_dir .. "win"
			end

			if arch == "x86_64" then
				-- 64-bit architecture
			elseif arch == "arm64" then
				config_dir = config_dir .. "_arm"
			else
				print("Unsupported architecture: " .. arch)
				return nil
			end

			return config_dir
		end

		local config = {
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
				"-jar",
				vim.fn.glob(
					home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
				),
				"-configuration",
				home .. "/.local/share/nvim/mason/packages/jdtls/" .. get_config_dir(),
				"-data",
				workspace_dir,
			},
			root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

			settings = {
				java = {
					signatureHelp = { enabled = true },
					extendedClientCapabilities = extendedClientCapabilities,
					maven = {
						downloadSources = true,
					},
					referencesCodeLens = {
						enabled = true,
					},
					references = {
						includeDecompiledSources = true,
					},
					inlayHints = {
						parameterNames = {
							enabled = "all", -- literals, all, none
						},
					},
					format = {
						enabled = false,
					},
				},
			},

			init_options = {
				bundles = {},
			},
		}
		require("jdtls").start_or_attach(config)

		-- i need to go over and change them
		vim.keymap.set(
			"n",
			"<leader>co",
			"<Cmd>lua require'jdtls'.organize_imports()<CR>",
			{ desc = "Organize Imports" }
		)
		vim.keymap.set(
			"n",
			"<leader>crv",
			"<Cmd>lua require('jdtls').extract_variable()<CR>",
			{ desc = "Extract Variable" }
		)
		vim.keymap.set(
			"v",
			"<leader>crv",
			"<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
			{ desc = "Extract Variable" }
		)
		vim.keymap.set(
			"n",
			"<leader>crc",
			"<Cmd>lua require('jdtls').extract_constant()<CR>",
			{ desc = "Extract Constant" }
		)
		vim.keymap.set(
			"v",
			"<leader>crc",
			"<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
			{ desc = "Extract Constant" }
		)
		vim.keymap.set(
			"v",
			"<leader>crm",
			"<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
			{ desc = "Extract Method" }
		)
	end,
}
