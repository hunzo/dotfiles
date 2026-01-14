local keymap = vim.keymap

-- Key mapping defaults
local opts = { noremap = true, silent = true }
-- Move selected lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Clear search highlight
keymap.set("n", "<leader>n", ":nohlsearch<CR>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit<CR>", opts)
keymap.set("n", "<Tab>", ":tabnext<CR>", opts)
keymap.set("n", "<S-Tab>", ":tabprev<CR>", opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)

-- Split windows
keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)

-- Resize windows easily
keymap.set("n", "<C-Left>", "<C-w><", opts)
keymap.set("n", "<C-Right>", "<C-w>>", opts)
keymap.set("n", "<C-Up>", "<C-w>+", opts)
keymap.set("n", "<C-Down>", "<C-w>-", opts)

-- Plugin mappings
-- Neo-Tree filesystem toggle
-- keymap.set("n", "<C-n>", ":Neotree toggle filesystem reveal float<CR>", opts)
keymap.set("n", "<C-n>", ":Neotree toggle filesystem left<CR>", opts)

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent Files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Grep String" })
