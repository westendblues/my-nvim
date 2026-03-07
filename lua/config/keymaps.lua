local map = vim.keymap.set

map("n", "<C-s>", "<cmd>w<CR>", {desc = "save file"})

-- LSP code actions
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { desc = "LSP code actions" })

map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves highlighted line up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves highlighted line down" })

map("n", "*", [[:let @/='\<' . expand('<cword>') . '\>' | set hlsearch<CR>]], { noremap = true, silent = true })

