vim.keymap.set("n", "<leader>ft", "<cmd>NERDTreeFind<Enter>", {})
vim.keymap.set("n", "<C-q>", "<cmd>NERDTreeToggle<Enter>", {})

vim.cmd [[ let NERDTreeIgnore = [ '^node_modules$', '^deps$', '^target$', '^__pycache__$', '^.git$', '^.dist$', '^.next$', '^dist$' ] ]]

vim.cmd [[ let NERDTreeWinSize = 40 ]]
