return {
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
	{ "oxfist/night-owl.nvim", lazy = false, priority = 1000 },
	{ "gbprod/nord.nvim", lazy = false, priority = 1000 },
	{ "maxmx03/solarized.nvim", lazy = false, priority = 1000 },
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_better_performance = 1
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_enable_italic = true
		end,
	},
	{ "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
	{
		"binhtran432k/dracula.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "rose-pine/neovim", lazy = false, name = "rose-pine", priority = 1000 },
	-- { "", lazy = false, priority = 1000 },
}
