local site = vim.fn.stdpath("data") .. "/site"

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		vim.opt.runtimepath:append(site)

		require("nvim-treesitter.configs").setup({
			parser_install_dir = site,
			ensure_installed = {
				"asm",
				"bash",
				"bitbake",
				"c",
				"cmake",
				"cpp",
				"csv",
				"dockerfile",
				"objdump",
				"perl",
				"python",
				"regex",
				"make",
				"markdown",
				"markdown_inline",
				"vim",
				"lua",
				"vimdoc",
				"xml",
				"json",
				"yaml",
				"html",
				"css",
				"javascript",
				"rust",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
