return {
  "karb94/neoscroll.nvim",
  lazy = false,
  config = function()
    require("neoscroll").setup {}
  end,
  enabled = false, -- disabled since I am using scroll from snacks.nvim
}
