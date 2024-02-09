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

	if vim.loop.os_uname().sysname == "Windows_NT" then
		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = "*.vs,*.fs",
			command = "set ft=glsl",
		})
	end

	-- i know this ain't no event but I got nowhere to put it
	-- create a command
	vim.api.nvim_create_user_command("Wake", "w | !make", {})
	-- vim.api.nvim_create_user_command("DuckGoBrrr", function()
	-- 	require("duck").hatch("🐤")
	-- end, {})
end)
