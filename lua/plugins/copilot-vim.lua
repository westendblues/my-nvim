return {
  "github/copilot.vim",
  lazy = true, -- Enable lazy loading
  enabled = true,
  event = "InsertEnter", -- Load when entering Insert mode

  -- keys = {
  --   {
  --     "<C-a>", -- Pressing Ctrl+a in Insert mode
  --     function()
  --       return vim.fn["copilot#Accept"] "<CR>"
  --     end,
  --     expr = true,
  --     mode = "i",
  --     desc = "Accept Copilot Suggestion",
  --   },
  -- },
  config = function()
    vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })
    vim.g.copilot_no_tab_map = true
  end,
}
