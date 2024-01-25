require("oil").setup({})

vim.keymap.set("n", "<leader>fo", "<cmd>Oil<Enter>", { desc = "Open parent directory" })
