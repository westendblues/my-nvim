return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  lazy = true,
  cmd = "NoNeckPain",
  keys = {
    {
      "<leader>N",
      -- "<cmd>NoNeckPain<CR>",
      function()
        if not no_neck_pain_original_fillchars then
          no_neck_pain_original_fillchars = vim.opt.fillchars:get()
          vim.opt.fillchars = vim.opt.fillchars + { vert = " " }
        else
          vim.opt.fillchars = no_neck_pain_original_fillchars
          no_neck_pain_original_fillchars = nil
        end
        require("no-neck-pain").toggle()
      end,
      desc = "No neck pain :)",
      mode = "n",
    },
    -- {
    --   "<leader>Nr",
    --   "<cmd>NoNeckPainToggleRightSide<CR>",
    --   desc = "No neck pain without right side",
    --   mode = "n",
    -- },
  },
  config = function()
    require("no-neck-pain").setup {
      width = 140,
      buffers = {
        right = {
          enabled = false,
        },
      },
    }
  end,
}
