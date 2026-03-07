return {
  "j-morano/buffer_manager.nvim",
  lazy = true,
  keys = {
    {
      "<leader>B",
      function()
        require("buffer_manager.ui").toggle_quick_menu()
      end,
      desc = "Quick buffer menu",
      mode = "n",
    },
  },
  config = function()
    -- Any plugin setup or configuration goes here
    require("buffer_manager").setup()
  end,
}
