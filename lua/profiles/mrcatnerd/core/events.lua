-- line numbers
vim.schedule(function()
	vim.api.nvim_create_autocmd({ "InsertEnter" }, {
		callback = function()
			vim.opt.nu = false
			vim.opt.relativenumber = false
			vim.opt.number = true
		end,
	})

	vim.api.nvim_create_autocmd({ "InsertLeave" }, {
		callback = function()
			vim.opt.number = false
			vim.opt.nu = true
			vim.opt.relativenumber = true
		end,
	})

	-- dont list quickfix buffers
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "qf", "notify" },
		callback = function()
			vim.opt_local.buflisted = false
		end,
	})

	-- where should yall go?
	vim.api.nvim_create_user_command("S2T", "%s/    /\\t/g", {}) -- space to tab
	vim.api.nvim_create_user_command("T2S", "%s/\\t/    /g", {}) -- tab to space

	-- 4 space gang rules!
end)
