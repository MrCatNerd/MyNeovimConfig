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

	vim.api.nvim_create_autocmd({ "InsertLeavePre" }, {
		callback = function()
			vim.opt.number = false
			vim.opt.nu = true
			vim.opt.relativenumber = true
		end,
	})

	if vim.loop.os_uname().sysname == "Windows_NT" then
		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = "*.vs,*.fs",
			command = "set ft=glsl",
		})
	end
end)
