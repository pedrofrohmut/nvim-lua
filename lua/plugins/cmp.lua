local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
    completion = {
        autocomplete = false,
    },
    snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = "luasnip" },
        { name = 'nvim_lsp_signature_help' },
        { name = "nvim_lsp" },
    }, {
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

local lsp_completion = {
    config = {
        sources = cmp.config.sources({
            { name = "luasnip" },
            { name = 'nvim_lsp_signature_help' },
            { name = "nvim_lsp" },
        })
    }
}

vim.keymap.set("i", "<C-j>", function() cmp.complete(lsp_completion) end)

local simple_completion = {
    config = {
        sources = cmp.config.sources({
            { name = "buffer" },
            { name = "path" },
        })
    }
}

vim.keymap.set("i", "<C-n>", function()
    if cmp.visible() then
        cmp.select_next_item()
    else
        cmp.complete(simple_completion)
    end
end)

vim.keymap.set("i", "<C-p>", function()
    if cmp.visible() then
        cmp.select_prev_item()
    else
        cmp.completion(simple_completion)
    end
end)

local snip_completion = {
    config = {
        sources = cmp.config.sources({
            { name = "luasnip" },
        })
    }
}

vim.keymap.set("i", "<C-s>", function() cmp.complete(snip_completion) end)
