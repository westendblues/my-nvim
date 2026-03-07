local map = vim.keymap.set

map("n", "<C-s>", "<cmd>w<CR>", {desc = "save file"})

-- Custom Keybindings (based on NvChad + custom preferences)

-------------------------------------- Insert Mode Navigation ------------------------------------------

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-------------------------------------- Window Navigation ------------------------------------------

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-------------------------------------- General Utilities ------------------------------------------

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-------------------------------------- LSP code actions ------------------------------------------
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { desc = "LSP code actions" })

-------------------------------------- LSP Diagnostics ------------------------------------------

map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-------------------------------------- Terminal ------------------------------------------

-- map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
--
-- -- New terminals
-- map("n", "<leader>h", function()
--   require("nvchad.term").new { pos = "sp" }
-- end, { desc = "terminal new horizontal term" })
--
-- map("n", "<leader>v", function()
--   require("nvchad.term").new { pos = "vsp" }
-- end, { desc = "terminal new vertical term" })

-- Toggleable terminals (optional - requires snacks/toggleterm)
-- map({ "n", "t" }, "<A-v>", function()
--   require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
-- end, { desc = "terminal toggleable vertical term" })
--
-- map({ "n", "t" }, "<A-h>", function()
--   require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
-- end, { desc = "terminal toggleable horizontal term" })
--
-- map({ "n", "t" }, "<A-i>", function()
--   require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
-- end, { desc = "terminal toggle floating term" })

-------------------------------------- Comment Toggle ------------------------------------------

map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-------------------------------------- Line Movement ------------------------------------------

map("v", "K", ":m '<-2<CR>gv=gv", { desc = "move line up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "move line down" })

-------------------------------------- Custom Search ------------------------------------------

-- Word boundary search (preserves case)
map("n", "*", [[:let @/='\<' . expand('<cword>') . '\>' | set hlsearch<CR>]], { noremap = true, silent = true })
