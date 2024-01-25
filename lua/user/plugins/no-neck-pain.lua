require("no-neck-pain").setup({
    width = 120,
	buffers = {
		wo = {
			fillchars = "eob: ",
		},
	},
})

vim.keymap.set("n", "<leader>zz", "<cmd>NoNeckPain<Enter>")
