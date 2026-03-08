return {
	"numToStr/comment.nvim",
	lazy = true,
	event = "BufReadPost",
	config = function()
		require("Comment").setup({
			ignore = "^$",
		})
	end,
}
