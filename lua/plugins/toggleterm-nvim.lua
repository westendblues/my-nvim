return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = true,
	cmd = { "ToggleTerm", "TermExec" },
	keys = {
		{ "<A-v>", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Toggle vertical terminal" },
		{ "<A-h>", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Toggle horizontal terminal" },
		{ "<A-i>", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle floating terminal" },
	},
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = nil,
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
	end,
}
