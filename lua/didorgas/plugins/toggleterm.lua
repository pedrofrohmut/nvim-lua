local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
    print("Error to load the terminal. Check your configuration")
    return
end

vim.keymap.set("n", "<C-q>", "<cmd>ToggleTerm<Enter>", { noremap = true, silent = true })

toggleterm.setup {
    direction = "float",
}
