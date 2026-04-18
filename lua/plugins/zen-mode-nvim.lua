return {
  "folke/zen-mode.nvim",
  lazy = true,
  keys = {
    { "<leader>mz", "<cmd> ZenMode <CR>", mode = "n", desc = "Zen Mode" },
  },
  opts = {
    window = {
      backdrop = 1,
      width = .65,
    },

    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
