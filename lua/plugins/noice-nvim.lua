return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  -- keys = {
  --   { "<space><space>", "<cmd>NoiceDismiss<CR>", desc = "Dismiss noice notifcation", mode = "n" },
  -- },

  opts = {
    -- add any options here
    messages = {
      -- NOTE: If you enable messages, then the cmdline is enabled automatically.
      -- This is a current Neovim limitation.
      enabled = true, -- enables the Noice messages UI
      view = "notify", -- default view for messages
      view_error = "notify", -- view for errors
      view_warn = "notify", -- view for warnings
      -- view = "mini", -- default view for messages
      -- view_error = "mini", -- view for errors
      -- view_warn = "mini", -- view for warnings
      view_history = "messages", -- view for :messages
      view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    notify = {
      -- Noice can be used as `vim.notify` so you can route any notification like other messages
      -- Notification messages have their level and other properties set.
      -- event is always "notify" and kind can be any log level as a string
      -- The default routes will forward notifications to nvim-notify
      -- Benefit of using Noice for this is the routing and consistent history view
      enabled = false,
      view = "notify",
    },
    lsp = {
      messages = {
        -- Messages shown by lsp servers
        enabled = true,
        view = "notify",
        opts = {},
      },
    },
    presets = {
      command_palette = true,
      --   bottom_search = false,
      --   command_palette = {
      --     views = {
      --       cmdline_popup = {
      --         position = {
      --           row = "50%",
      --           col = "50%",
      --         },
      --         size = {
      --           min_width = 60,
      --           width = "auto",
      --           height = "auto",
      --         },
      --       },
      --       -- uncomment lines below if not used nvim-cmp as backend
      --       -- cmdline_popupmenu = {
      --       --     position = {
      --       --         row = "80%",
      --       --         col = "50%",
      --       --     },
      --       -- },
      --     },
      --   },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- "rcarriga/nvim-notify",
  },
}
