return {
  "Pocco81/true-zen.nvim",
  lazy = true,
  keys = {
    { "Z", "<cmd> TZAtaraxis <CR>", desc = "True Zen Mode", mode = "n" },
  },
  config = function()
    require("true-zen").setup {
      -- your config goes here
      -- or just leave it empty :)
    }
  end,
  enabled = false,
}
