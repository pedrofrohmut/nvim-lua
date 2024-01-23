-- Fixers
vim.g.ale_fix_on_save = 0
vim.g.ale_fixers = {
    javascript = { "prettier", "eslint" },
    html = { "prettier" },
    css = { "prettier" },
}

vim.keymap.set("n", "<F7>", "<cmd>ALEFix<Enter>")

-- Linters
vim.g.ale_linters_explict = 1
vim.g.ale_linters = {
    javascript =  { "eslint" }
}

-- Completion
vim.g.ale_completion_enabled = 0

-- Diagnostic
vim.g.ale_virtualtext_cursor = 'disabled'

-- LSP
vim.g.ale_disable_lsp = 1

-- Hover
vim.g.ale_hover_cursor = 0
