local cmp = require("cmp")

cmp.setup({
    completion = {
        autocomplete = false,
    },
    snippet = { -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- FROM DEFAULT CONFIG
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- ["<C-Space>"] = cmp.mapping.complete(),
        -- ["<C-e>"] = cmp.mapping.abort(),
        ["<C-Space>"] = cmp.mapping.abort(),
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- MY_CUSTOM_MAPS
        -- ["<C-y>"] = cmp.config.disable, -- (in old config) dont remember why yet
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ["<C-j>"] = cmp.mapping.complete({
            config = {
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                })
            }
        }),
    }),
    sources = cmp.config.sources({
        { name = 'luasnip' }, -- For luasnip users.
        { name = "buffer"   },
        -- { name = "nvim_lsp" },
    })
})

vim.keymap.set("i", "<C-Space>", function() cmp.complete() end)

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
-- cmp.setup.cmdline(":", {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = "path" }
--     }, {
--         { name = "cmdline" }
--     })
-- })
