return {
  "ackeraa/todo.nvim",
  lazy = true,
  cmd = "Todo",
  config = function()
    require("todo").setup {
      opts = {
        file_path = "/home/u640100/.config/nvim/todo.txt",
      },
    }
  end,
}
