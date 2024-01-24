-- This is here to work with Friendly Snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- For LuaSnips in lua
require("luasnip.loaders.from_lua").lazy_load({
    paths = "~/.config/nvim/snippets/"
})

local ls = require("luasnip")

local try_jump_forward = function()
    if ls.expand_or_jumpable() then
        ls.jump(1) -- Forward
    end
end

local try_jump_backwards = function()
    if ls.expand_or_jumpable() then
        ls.jump(-1) -- Backwards
    end
end

vim.keymap.set("i", "<A-n>", try_jump_forward)
vim.keymap.set("i", "<A-p>", try_jump_backwards)
