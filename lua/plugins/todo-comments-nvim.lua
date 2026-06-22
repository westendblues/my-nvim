return {
	"folke/todo-comments.nvim",
	lazy = true,
	event = "BufReadPost",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		highlight = {
			pattern = [[.*<(KEYWORDS)\s*|:]],
		},
		search = {
			pattern = [[\b(KEYWORDS)\b]],
		},
	},
	enabled = false,
}
