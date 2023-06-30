--[[
    Vim keymaps that must work with neovim without any plugin
    The plugins keymaps must be in their repective config files
    To discover maps just use RipGrep or :verbose <mode>map <key>
]]

vim.g.mapleader = " "

local map = vim.keymap.set

-- Unsetters: Do nothing to remove unwanted default behavior
map({"n", "v"}, "<Space>",   "<Nop>", { silent = true })
map("i",        "<C-j>",     "<Nop>")
map("n",        "R",         "<Nop>") -- Disable WTF mode
map({"n", "v"}, "<C-Space>", "<Nop>", { silent = true })

-- Function Keys
map("n", "<F1>", ":vertical help ")
map("n", "<F2>", ":verbose map ")

-- File Explorer
map("n", "<leader>fe", vim.cmd.Explore)
map("n", "<leader>fp", ":find ")

-- Create File
map("n", "<leader>nf", ":!touch ")
map("n", "<leader>nd", ":!mkdir -p ")

-- Redo on better mapping
map("n", "U", "<C-r>")

-- Reset command-line
map("n", "<C-c>", "<cmd>set cmdheight=1<Enter><cmd>echo ''<Enter>")

-- Delete in insert mode
map("i", "<C-l>", "<Del>")
map("i", "<C-h>", "<BS>")

-- Insert lines/spaces in Normal Mode
map("n", "<Enter>", "i<CR><Esc>")
-- Normal Enter/CR when needed
map("n", "<A-Enter>", "<CR>")

-- Insert spaces in normal mode
map("n", "<C-Space>", "i<Space><Esc>l")

-- Move Text (by Primeagen)
map("v", "J", ":move '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":move '<-2<CR>gv=gv", { silent = true })

-- Auto reselect visual mode when indenting (by Brodie Robertson)
map("v", ">", ">gv", { silent = true })
map("v", "<", "<gv", { silent = true })

-- Easy Register Copy/Cut to x
map("v", "<leader>xy", "\"xy")
map("v", "<leader>xd", "\"xd")
map("n", "<leader>xp", "\"xp")

-- Easy Register Copy/Cut to/from System Clipboard (:checkhealth if not working)
map("v", "<leader>sy", "\"+y")
map("v", "<leader>sd", "\"+d")
map("n", "<leader>sp", "\"+p")

-- Quickfix
map("n", "<A-n>", vim.cmd.cnext)
map("n", "<A-p>", vim.cmd.cprev)

-- ### MyPlugin: Closing cheracter #############################################

-- Closing character with <Enter> / <CR>
map("i", "(<CR>", "(<CR>)<Esc>ko")
map("i", "[<CR>", "[<CR>]<Esc>ko")
map("i", "[[<CR>", "[[<CR>]]<Esc>ko")
map("i", "{<CR>", "{<CR>}<Esc>ko")
map("i", "({<CR>", "({<CR>})<Esc>ko")
map("i", "`<CR>",  "<CR>`<Esc>ko<Tab>")
map("i", "(`<CR>", "(``)<Esc>hi<CR><Esc>ko<Tab>")

-- Add spaces inside closing character (lacking in autopairs plugin)
map("i", "( ", "(  )<Esc>hi")
map("i", "[ ", "[  ]<Esc>hi")
map("i", "[[ ", "[[  ]]<Esc>hi")
map("i", "{ ", "{  }<Esc>hi")
map("i", "({ ", "({  })<Esc>hi")

-- ### Buffers #################################################################

-- Next
map("n", "<leader>bn", ":bnext<CR>", { silent = true })

-- Previous
map("n", "<leader>bp", ":bprevious<CR>", { silent = true })

-- Utils
map("n", "<leader>bb", ":buffers<CR>")
map("n", "<leader>bx", ":buffers<CR>:b")
map("n", "<leader>bd", ":bdelete<CR>")
map("n", "<leader>ba", ":bufdo bd")

-- ### Tabs ####################################################################

-- New Tab
map("n", "<leader>tc", ":tabnew<CR>", { silent = true })

-- Close Tabs
map("n", "<leader>tq", ":tabclose<CR>", { silent = true })
map("n", "<leader>to", ":tabonly<CR>", { silent = true })

-- Move Tabs - Left/Right
map("n", "<leader>th", ":-tabmove<CR>", { silent = true })
map("n", "<leader>tl", ":+tabmove<CR>", { silent = true })

-- Go To - Next/Prev
map("n", "<C-l>",      ":tabnext<CR>",     { silent = true })
map("n", "<C-h>",      ":tabprevious<CR>", { silent = true })

-- ### Jumping/Scrolling #######################################################

-- Scrolling
map("n", "<C-k>", "12<C-y>")
map("n", "<C-j>", "12<C-e>")

map("n", "<C-d>", "28<C-e>M")
map("n", "<C-u>", "28<C-y>M")

-- Center when jumping
map("n", "G", "Gzz")
map("n", "`0", "`0zz")
map("n", "'0", "'0zz")

-- ### Windows #################################################################

-- Resize Horizontal
map("n", "<Up>", "3<C-w>+")
map("n", "<Down>", "3<C-w>-")

-- Resize Vertical
map("n", "<Left>",  "3<C-w>>")
map("n", "<Right>", "3<C-w><")

-- Change current window to a new tab
map("n", "<leader>wt", "<C-w>T")

-- Closes every other window and every other tab
map("n", "<leader>wo", function()
    vim.cmd.tabonly()
    vim.cmd.only()
    vim.cmd.echo("''")
end)

-- ### String Utils ###########################################################

-- Find-Replace
map("n", "<leader>ss", ":%s/")
map("v", "<leader>ss", ":s/")

-- Sort
map("v", "<leader>sp", ":sort<Enter>")

local f = require("utils.string-functions")

-- Remove trailing spaces
map("n", "<leader>s1", f.remove_trailing)

-- Insert 80 line
map("n", "<leader>sl", "a-<Esc>79.")
