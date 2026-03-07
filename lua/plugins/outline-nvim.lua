return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>cq", "<cmd>Outline<CR>", desc = "Toggle buffer outline", mode = "n" },
  },
  opts = {
    -- Your setup opts here
  },
}
