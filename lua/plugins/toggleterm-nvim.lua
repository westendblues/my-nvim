return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = true,
	cmd = { "ToggleTerm", "TermExec" },
	keys = {
		{ "<A-v>", "<cmd>ToggleTerm 1 direction=vertical<CR>", desc = "Toggle vertical terminal" },
		{ "<A-h>", "<cmd>ToggleTerm 2 direction=horizontal<CR>", desc = "Toggle horizontal terminal" },
		{ "<A-i>", "<cmd>ToggleTerm 3 direction=float<CR>", desc = "Toggle floating terminal" },
		{ "<leader>=", "<cmd>wincmd =<CR>", desc = "Resize windows equally" },
	},
	config = function()
		require("toggleterm").setup {
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				elseif term.direction == "float" then
					return 20
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
			persist_mode = true,
			direction = "float",
			close_on_exit = true,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
				height = function()
					return math.floor(vim.o.lines * 0.6)
				end,
				width = function()
					return math.floor(vim.o.columns * 0.6)
				end,
			},
		}

		-- Allow toggle from insert mode using Alt keybindings with separate terminal IDs
		vim.keymap.set("t", "<A-v>", "<C-\\><C-n><cmd>ToggleTerm 1 direction=vertical<CR>", { noremap = true, desc = "Toggle vertical terminal" })
		vim.keymap.set("t", "<A-h>", "<C-\\><C-n><cmd>ToggleTerm 2 direction=horizontal<CR>", { noremap = true, desc = "Toggle horizontal terminal" })
		vim.keymap.set("t", "<A-i>", "<C-\\><C-n><cmd>ToggleTerm 3 direction=float<CR>", { noremap = true, desc = "Toggle floating terminal" })

		-- Map Escape to exit terminal insert mode (allows copying) but don't close terminal
		vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, desc = "Exit terminal insert mode" })

		-- Prevent Ctrl+D from closing terminal - keep it for shell EOF
		-- The terminal will stay open unless explicitly closed with keybinding
	end,
}
