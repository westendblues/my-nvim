require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.lspconfig")
require("config.autocmds")
require("config.projectcmds").setup()

vim.cmd.colorscheme("gruvbox-material")
