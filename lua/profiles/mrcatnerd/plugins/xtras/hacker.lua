return {
	"letieu/hacker.nvim", -- yep
	enabled = false,
	cmd = {
		"Hack",
		"HackAuto",
		"HackFollow",
		"HackFollowAuto",
	},
	config = function()
		require("hacker").setup({
			-- content = [[ Code want to show.... ]],   -- The code snippet that show when typing
			-- filetype = "lua",                        -- filetype of code snippet
			speed = { -- characters insert each time, random from min -> max
				min = 2,
				max = 10,
			},
			-- note: is_popup is very bugged
			is_popup = false, -- show random float window when typing
			popup_after = 5,
		})
	end,
}
