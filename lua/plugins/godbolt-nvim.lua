return {
  "p00f/godbolt.nvim",
  lazy = true,
  cmd = "Godbolt",

  config = function()
    require("godbolt").setup {
      languages = {
        cpp = { compiler = "armg730", options = {"-std=c++17 -O0 -Wall"} },
        c = { compiler = "armg730", options = {} },
      },
      auto_cleanup = true, -- remove highlights and autocommands on buffer close
      highlight = {
        cursor = "Visual", -- `cursor = false` to disable
        -- values in this table can be:
        -- 1. existing highlight group
        -- 2. hex color string starting with #
        static = { "#222222", "#333333", "#444444", "#555555", "#444444", "#333333" },
        -- `static = false` to disable
      },
      -- `highlight = false` to disable highlights
      quickfix = {
        enable = true, -- whether to populate the quickfix list in case of errors
        auto_open = true, -- whether to open the quickfix list in case of errors
      },
      url = "https://godbolt.org", -- can be changed to a different godbolt instance
    }
  end,
}
