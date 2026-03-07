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
    on_close = function()
      -- local buffer_number = vim.api.nvim_get_current_buf()
      -- local windows = vim.api.nvim_list_wins()
      -- vim.api.nvim_set_current_buf(buffer_number)
      -- vim.api.nvim_win_set_buf(windows[1], buffer_number)
    end,

    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
