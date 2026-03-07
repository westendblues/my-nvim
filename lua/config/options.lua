-- print("Welcome to my awesome nvim options")

local o = vim.opt

vim.g.mapleader = " "

o.number = true
o.relativenumber = true
o.scrolloff = 10

o.cursorlineopt ='both' -- to enable cursor line!

o.expandtab = true  -- Use spaces instead of tabs
o.shiftwidth = 4    -- Number of spaces to use for each step of (auto)indent
o.tabstop = 4       -- Number of spaces that a <Tab> in the file counts for

o.swapfile = false

