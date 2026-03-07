--NOTE: nice highlighting of TODO, FIX, NOTE, etc. also TodoTelescop
--HACK this looks hacky
--TODO: something todo
--FIX something to fix
--WARNING some warning

return {
  "folke/todo-comments.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*|:]],
    },
    search = {
      pattern = [[\b(KEYWORDS)\b]],
    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
