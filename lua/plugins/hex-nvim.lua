return {
	"RaafatTurki/hex.nvim",
	lazy = false,
	ft = { "hex" },
	config = function()
		require("hex").setup()
	end,
    enabled = false
}
