return {
  "nvim-telescope/telescope-media-files.nvim",
  config = function()
    require("telescope").load_extension "media_files"
  end,
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg", "pdf" },
      -- find command (defaults to `fd`)
      find_cmd = "rg",
    },
  },
}
