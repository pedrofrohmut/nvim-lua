local cmp = require("cmp")

require("luasnip")

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- ["<C-Space>"] = cmp.mapping.complete(),
        -- ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        -- Group 1: Priority group
        { name = "luasnip" },
        { name = 'nvim_lsp_signature_help' },
        { name = "nvim_lsp" },
    }, {
        -- Group 2: Only shows when group 1 not available
        { name = "buffer" },
        { name = "path" },
    })
})

vim.keymap.set("i", "<C-Space>", function()
    if cmp.visible() then
        cmp.abort()
    else
        cmp.complete()
    end
end)

-- cmp.setup {
--   sources = {
--     { name = 'nvim_lsp_signature_help' }
--   }
-- }
