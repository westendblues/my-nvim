-- if doesn't work automatically, use 'set filetype=log' on a file that is log
return {
  "fei6409/log-highlight.nvim",
  lazy = true,
  ft = {"log", "text"},
  config = function()
    require("log-highlight").setup {
      -- your config goes here
      -- or just leave it empty :)
      extension = "txt"
    }
  end,
}
