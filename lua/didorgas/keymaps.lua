local options = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- Function Keys
map("n", "<F1>", ":vertical help ", { noremap = true })
map("n", "<F12>", "<cmd>LspInfo<Enter>", { noremap = true })

-- File Explorer
map("n", "<leader>fe", ":Ex<CR>", options)

-- Closer del
map("i", "<C-l>", "<Del>", options)

-- Insert lines in Normal Mode
map("n", "<CR>", "i<CR><Esc>", options)
map("n", "<leader>j", "o<Esc>k", options)
map("n", "<leader>k", "O<Esc>j", options)

-- Scrolling (Needed on Windows/WSL)
map("n", "<A-j>", "3<C-e>", options)
map("n", "<A-k>", "3<C-y>", options)

-- Move Text
map("v", "<C-j>", ":move '>+1<CR>gv-gv", options)
map("v", "<C-k>", ":move '<-2<CR>gv-gv", options)

-- Easy Register Copy/Cut to x
map("v", "<A-y>", "\"xy", options)
map("v", "<A-d>", "\"xd", options)
map("n", "<A-p>", "\"xp", options)

-- Easy Register Copy/Cut to/from System Clipboard (:checkhealth if not working)
map("v", "<leader>sy", "\"+y", options)
map("v", "<leader>sd", "\"+d", options)
map("n", "<leader>sp", "\"+p", options)

-- ### String Utils ###########################################################

-- Remove trailing spaces
map("n", "<leader>s1", "<cmd>lua require('didorgas.stringFunctions').removeTrailing()<Enter>", options)

-- Indent 2 to 4 spaces
map("n", "<leader>s2", "<cmd>lua require('didorgas.stringFunctions').indent2to4()<Enter>", options)

-- ### Plugin: Closing cheracter ###############################################
map("i", "(<CR>", "(<CR>)<Esc>ko", options)
map("i", "[<CR>", "[<CR>]<Esc>ko", options)
map("i", "[[<CR>", "[[<CR>]]<Esc>ko", options)
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

-- Splits
map("n", "<leader>ws", "<C-w>s", options)
map("n", "<leader>wv", "<C-w>v", options)

-- Change/Rotate Focus
map("n", "<C-j>", "<C-w>w", options) -- Next
map("n", "<C-k>", "<C-w>W", options) -- Prev
