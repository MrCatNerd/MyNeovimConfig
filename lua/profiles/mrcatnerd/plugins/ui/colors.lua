function ColorMyPencils(color)
	-- color = color or "hybrid"
	-- color = color or "catppuccin-frappe"
	-- color = color or "catppuccin-mocha"
	color = color or "rose-pine-moon"

	vim.cmd.colorscheme(color)

	-- comment 2 of the lines below if you want to disable transparency
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

vim.schedule(function()
	ColorMyPencils()
end)
