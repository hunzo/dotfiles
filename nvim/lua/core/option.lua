local opt = vim.opt

-- Basic editor settings
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
opt.softtabstop = 2 -- Number of spaces that a <Tab> counts for while performing editing operations
opt.shiftwidth = 2 -- Size of an indent
opt.relativenumber = true -- Show relative line numbers
opt.number = true -- Show absolute line number on current line
opt.signcolumn = "yes" -- Always show the signcolumn
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.wrap = false -- Disable line wrap
