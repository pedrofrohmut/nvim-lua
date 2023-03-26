local cmp = require("cmp")
local ls = require("luasnip")

cmp.setup({
    completion = {
        autocomplete = false,
    },
    snippet = {
        expand = function(args) ls.lsp_expand(args.body) end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "buffer" },
        { name = "path" },
    })
})

-- local simple_completion = {
--     config = {
--         sources = cmp.config.sources({
--             { name = "buffer" },
--             { name = "path" },
--         })
--     }
-- }

local lsp_completion = {
    config = {
        sources = cmp.config.sources({
            -- { name = "luasnip" },
            { name = "nvim_lsp" },
        })
    }
}

local snip_completion = {
    config = {
        sources = cmp.config.sources({
            { name = "luasnip" },
        })
    }
}

-- vim.keymap.set("i", "<C-n>", function()
--     if cmp.visible() then
--         cmp.select_next_item()
--     else
--         cmp.complete(simple_completion)
--     end
-- end)
--
--
-- vim.keymap.set("i", "<C-p>", function()
--     if cmp.visible() then
--         cmp.select_prev_item()
--     else
--         cmp.completion(simple_completion)
--     end
-- end)


vim.keymap.set("i", "<C-j>", function()
    if not cmp.visible() then
        cmp.complete(lsp_completion)
    else
        cmp.select_next_item()
    end
end)

vim.keymap.set("i", "<C-k>", function()
    if not cmp.visible() then
        cmp.complete(snip_completion)
    else
        cmp.select_prev_item()
    end
end)

vim.keymap.set("i", "<C-o>", function()
    if cmp.visible() then
        cmp.abort()
    end
end)
