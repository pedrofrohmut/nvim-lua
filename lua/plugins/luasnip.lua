local ok, luasnip = pcall(require, "luasnip")
if not ok then
    error("Could not find luasnip")
end

vim.keymap.set("i", "<A-j>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.jump(1) -- Forward
    end
end)

vim.keymap.set("i", "<A-k>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.jump(-1) -- Backwards
    end
end)
