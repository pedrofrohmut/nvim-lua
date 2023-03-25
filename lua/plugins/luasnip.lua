-- This is here to work with Friendly Snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- For LuaSnips in lua
require("luasnip.loaders.from_lua").lazy_load({
    paths = "~/.config/nvim/snippets/"
})

local ls = require("luasnip")

vim.keymap.set("i", "<A-j>", function(fallback)
    if ls.expand_or_jumpable() then
        ls.jump(1) -- Forward
    else
        fallback()
    end
end)

vim.keymap.set("i", "<A-k>", function(fallback)
    if ls.expand_or_jumpable() then
        ls.jump(-1) -- Backwards
    else
        fallback()
    end
end)
