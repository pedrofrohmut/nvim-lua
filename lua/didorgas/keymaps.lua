local options = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- Help
map("n", "<F1>", ":vertical help ", {})

-- File Explorer
map("n", "<leader>fe", ":Ex<CR>", options)

-- Closer del
map("i", "<C-l>", "<Del>", options)

-- Insert lines in Normal Mode
map("n", "<CR>", "i<CR><Esc>", options)
map("n", "<leader>j", "o<Esc>k", options)
map("n", "<leader>k", "O<Esc>j", options)

-- Scrolling (Needed on Windows/WSL)
map("n", "<A-j>", "<C-e>", options)
map("n", "<A-k>", "<C-y>", options)

-- Move Text
map("v", "<C-j>", ":move '>+1<CR>gv-gv", options)
map("v", "<C-k>", ":move '<-2<CR>gv-gv", options)

-- Easy Register Copy/Cut to x
map("v", "<A-y>", "\"xy", options)
map("v", "<A-d>", "\"xd", options)
map("n", "<A-p>", "\"xp", options)

-- Function Utils
map("n", "<F4>", ":bufdo bd", { noremap = true }) -- Buffer Delete to all buffers / Reset
map("n", "<F11>", ":%s/\\s\\+$//g<CR>", { noremap = true }) -- Remove trailing spaces
map("n", "<F12>", ":source ~/.config/nvim/init.lua<CR>", { noremap = true }) -- Resource config

-- Closing character on Enter
map("i", "(<CR>", "(<CR>)<Esc>ko", options)
map("i", "[<CR>", "[<CR>]<Esc>ko", options)
map("i", "{<CR>", "{<CR>}<Esc>ko", options)
map("i", "({<CR>", "({<CR>})<Esc>ko", options)
map("i", "`<CR>",  "<CR>`<Esc>ko<Tab>", options)
map("i", "(`<CR>", "(``)<Esc>hi<CR><Esc>ko<Tab>", options)

-- ### Buffers #################################################################

-- Next
map("n", "<leader>bn", ":bnext<CR>", options)
map("n", "<leader>bl", ":bnext<CR>", options)

-- Previous
map("n", "<leader>bp", ":bprevious<CR>", options)
map("n", "<leader>bh", ":bprevious<CR>", options)

-- Utils
map("n", "<leader>bb", ":buffers<CR>", options)
map("n", "<leader>bx", ":buffers<CR>:b", { noremap = true })
map("n", "<leader>bd", ":bdelete<CR>", options)
map("n", "<leader>ba", ":bufdo bd", { noremap = true })

-- ### Tabs ####################################################################

-- New Tab
map("n", "<leader>tc", ":tabnew<CR>", options)

-- Close Tabs
map("n", "<leader>tq", ":tabclose<CR>", options)
map("n", "<leader>to", ":tabonly<CR>", options)

-- Move Tabs - Left/Right
map("n", "<leader>th", ":-tabmove<CR>", options)
map("n", "<leader>tl", ":+tabmove<CR>", options)

-- Go To - Next/Prev
map("n", "<leader>tn", ":tabnext<CR>", options)
map("n", "<C-l>", ":tabnext<CR>", options)
map("n", "<leader>tp", ":tabprevious<CR>", options)
map("n", "<C-h>", ":tabprevious<CR>", options)

-- ### Windows #################################################################

-- Resize Horizontal
map("n", "<Up>", ":resize +5<CR>", options)
map("n", "<Down>", ":resize -5<CR>", options)

-- Resize Vertical
map("n", "<Left>", ":vertical resize -5<CR>", options)
map("n", "<Right>", ":vertical resize +5<CR>", options)

-- Change/Rotate Focus
map("n", "<C-j>", "<C-w>w", options) -- Next
map("n", "<C-k>", "<C-w>W", options) -- Prev
