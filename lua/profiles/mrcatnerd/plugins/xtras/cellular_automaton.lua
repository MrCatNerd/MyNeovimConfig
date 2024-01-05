return {
	"eandrju/cellular-automaton.nvim",
	cmd = "CellularAutomaton",
	keys = {
		{
			"<leader>mr",
			function()
				require("cellular-automaton").start_animation("make_it_rain")
			end,
			desc = "make it rain",
		},
	},
}
