return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  lazy = true,
  keys = {
    { "<leader>fd", "<cmd> Telescope file_browser <CR>", desc = "Telescope file browser", mode = "n" },
    {
      "<leader>f-",
      "<cmd> Telescope file_browser path=%:p:h select_buffer=true <CR>",
      desc = "Telescope file browser",
      mode = "n",
    },
  },
}
