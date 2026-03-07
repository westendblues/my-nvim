return {
  -- requires 'xxd' command to be installed
  "RaafatTurki/hex.nvim",
  lazy = false,

  config = function()
    require("hex").setup()
  end,
}
