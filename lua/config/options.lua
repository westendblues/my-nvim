-- print("Welcome to my awesome nvim options")

local o   = vim.opt
local opt = vim.opt
local g   = vim.g

g.mapleader = " "


-------------------------------------- Global Settings ------------------------------------------

o.laststatus = 3              -- Single status bar at bottom
o.showmode = false            -- Hide mode (status shows it)
o.splitkeep = "screen"        -- Keep view when splitting

-------------------------------------- Clipboard ------------------------------------------

o.clipboard = "unnamedplus"   -- Use system clipboard

-------------------------------------- Visual ------------------------------------------

o.cursorlineopt = "both"      -- Highlight both number and line
o.cursorline = true           -- Highlight current line
opt.fillchars = { eob = " " } -- Hide ~ at end of file

-------------------------------------- Indentation ------------------------------------------

o.expandtab = true            -- Use spaces instead of tabs
o.shiftwidth = 4              -- Spaces per indent level
o.smartindent = true          -- Smart auto-indent
o.tabstop = 4                 -- Tab width
o.softtabstop = 4             -- Soft tab width

-------------------------------------- Search ------------------------------------------

o.ignorecase = true           -- Case insensitive search
o.smartcase = true            -- Smart case matching

-------------------------------------- UI ------------------------------------------

o.number = true               -- Line numbers
o.numberwidth = 2             -- Line number column width
o.relativenumber = true       -- Relative line numbers
o.mouse = "a"                 -- Enable mouse support
o.signcolumn = "yes"          -- Always show sign column
o.splitbelow = true           -- New split goes below
o.splitright = true           -- New vsplit goes right

-------------------------------------- Behavior ------------------------------------------

o.timeoutlen = 400            -- Keybind timeout (ms)
o.undofile = true             -- Persistent undo history
o.updatetime = 250            -- Swap file write interval
o.scrolloff = 10              -- Keep cursor away from edges
opt.whichwrap:append "<>[]hl" -- Wrap h/l at line ends
opt.shortmess:append "sI"     -- Hide intro message and search count
o.swapfile = false            -- Disable swap files

-------------------------------------- Performance ------------------------------------------

-- Disable unused providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-------------------------------------- LSP/Tools ------------------------------------------

-- Add mason.nvim binaries to PATH
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH

