return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	lazy = false,
	config = function()
		require("treesitter-context").setup({
			enable = true,

			-- show at most this many context lines
			max_lines = 4,

			-- don't show context in very small windows
			min_window_height = 10,

			-- show line numbers in context
			line_numbers = true,

			-- collapse long multi-line context blocks
			multiline_threshold = 20,

			-- keep outer scope visible (better for C/C++)
			trim_scope = "outer",

			-- context based on cursor location (more intuitive)
			mode = "cursor",

			-- draw a separator under context
			-- separator = " ",

			-- ensure it renders above other UI
			zindex = 20,
		})

		-- optional but very useful: jump to current context
		vim.keymap.set("n", "[c", function()
			require("treesitter-context").go_to_context()
		end, { silent = true, desc = "Go to context" })
	end,
}
