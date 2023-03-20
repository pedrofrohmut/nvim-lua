-- NOTE: You can use other key to expand snippet.

-- Expand
vim.cmd [[
    inoremap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
    snoremap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
]]

-- Expand or jump
vim.cmd [[
    inoremap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
    snoremap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
]]

-- Jump forward or backward
vim.cmd [[
    inoremap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    snoremap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    inoremap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    snoremap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
]]

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
-- vim.cmd [[
--     nnoremap        s   <Plug>(vsnip-select-text)
--     xnoremap        s   <Plug>(vsnip-select-text)
--     nnoremap        S   <Plug>(vsnip-cut-text)
--     xnoremap        S   <Plug>(vsnip-cut-text)
-- ]]

-- If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
-- vim.cmd [[
--     let g:vsnip_filetypes = {}
--     let g:vsnip_filetypes.javascriptreact = ['javascript']
--     let g:vsnip_filetypes.typescriptreact = ['typescript']
-- ]]
