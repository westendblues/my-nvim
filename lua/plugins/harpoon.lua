return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  keys = {
    {
      "<leader>o",
      function()
        local harpoon = require "harpoon"
        harpoon:setup()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon Quick List",
      mode = "n",
    },
    {
      "<leader>ha",
      function()
        local harpoon = require "harpoon"
        harpoon:setup()
        harpoon:list():add()
      end,
      desc = "Add Buffer to Harpoon",
      mode = "n",
    },
    {
      "<leader>ht",
      "<cmd>Telescope harpoon marks<CR>",
      desc = "Telescope Harpoon Marks",
      mode = "n",
    },
  },
}
