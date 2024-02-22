--  formatting events moved to formatter.nvim files

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

	vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
		pattern = { "*.vs,*.fs", "*.shader", "*.vert", "*.frag", "*.geom", "*.tesc", "*.tese", "*.comp" },
		command = "set ft=glsl",
	})
end)
