local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Groups
augroup("FileTypeCmds", { clear = true })
augroup("CursorLine", { clear = true })

-- Remove auto insert comments next line
autocmd("FileType", {
    group = "FileTypeCmds", pattern = "*", command = "setlocal formatoptions-=cro" })

-- Set 4 indent to all files
autocmd("FileType", {
    group = "FileTypeCmds", pattern = "*", command = "setlocal shiftwidth=4" })

-- Set 2 for exceptions
autocmd("FileType", {
    group = "FileTypeCmds", pattern = {"html"}, command = "setlocal shiftwidth=2 "})

-- Set cursorline on enter
autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
    group = "CursorLine", pattern = "*", command = "setlocal cursorline" })

-- Set nocursorline on leave
autocmd("WinLeave", {
    group = "CursorLine", pattern = "*", command = "setlocal nocursorline" })

-- Remove Trailing White Spaces onSave (And dont show errors)
autocmd("BufWritePre", { pattern = "*", command= ":%s/\\s\\+$//e" })
