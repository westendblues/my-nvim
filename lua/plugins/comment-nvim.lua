return {
	"numToStr/comment.nvim",
	lazy = true,
	event = "BufReadPost",
	config = function()
		require("comment").setup({
			ignore = "^$",
		})
	end,
}
