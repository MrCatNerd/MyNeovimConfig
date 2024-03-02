return {
	"tjdevries/vim-inyoface",
	cmd = { "InYoFaceToggle" },
	keys = {
		{
			"<leader>la",
			"<Plug>(InYoFace_Toggle)<CR>",
			desc = "IN YO FACE",
			silent = true,
		},
	},
	config = function()
		vim.api.nvim_create_user_command("InYoFaceToggle", "silent call inyoface#toggle_comments()", {})
	end,
}
