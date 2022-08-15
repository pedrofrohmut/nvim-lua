vim.cmd [[
    augroup vimrcCompileMap
        " CleanUp
        autocmd!
        " Map <leader>rf to save, compile and run single source file.
        if has("win32")
            autocmd FileType cpp nnoremap <buffer> <leader>rf :w<CR>:!cls && cl /EHsc % && %< <CR>
            autocmd FileType python nnoremap <buffer> <leader>rf :w<CR>:!py % <CR>
        else
            autocmd FileType c nnoremap <buffer> <leader>rf :w<CR>:!gcc -o %< % && ./%< <CR>
            autocmd FileType cpp nnoremap <buffer> <leader>rf :w<CR>:!g++ -o %< % && ./%< <CR>
            autocmd FileType python nnoremap <buffer> <leader>rf :w<CR>:!python % <CR>
            endif
    augroup END
]]
