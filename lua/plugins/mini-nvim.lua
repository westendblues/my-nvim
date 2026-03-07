return {
  "echasnovski/mini.nvim",
  version = false,
  lazy = true,
  keys = {
    { "<space>mf", ":lua MiniFiles.open()<CR>", desc = "Open mini files project root", mode = "n" },
    {
      "-",
      function()
        local buf_name = vim.api.nvim_buf_get_name(0)
        local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
        MiniFiles.open(path)
        MiniFiles.reveal_cwd()
      end,
      desc = "Open Mini Files current buffer",
      mode = "n",
    },
  },
  config = function()
    require("mini.files").setup { windows = { preview = true, width_preview = 75, } }

  end,
}
