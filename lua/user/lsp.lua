local map = vim.keymap.set

-- Mappings --------------------------------------------------------------------

map("n", "<F11>", function()
    vim.cmd.LspRestart()
    vim.cmd.echo('"Lsp Restarted"')
end)
map("n", "<F12>",      vim.cmd.LspInfo,           { silent = true })
map("n", "<C-p>",      vim.diagnostic.goto_prev,  { silent = true })
map("n", "<C-n>",      vim.diagnostic.goto_next,  { silent = true })
map("n", "<leader>do", vim.diagnostic.open_float, { silent = true })
map("n", "<leader>dl", vim.diagnostic.setloclist, { silent = true })
map("n", "<leader>dd", vim.diagnostic.disable,    { silent = true })
map("n", "<leader>de", vim.diagnostic.enable,     { silent = true })
map("n", "<leader>cf", vim.lsp.buf.format,        { silent = true })

-- Config ----------------------------------------------------------------------

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
    local bufopts = { silent = true, buffer = bufnr }

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local telescope_builtin = require("telescope.builtin")

    map("n", "gd", function()
        if not pcall(telescope_builtin.lsp_definitions) then
            vim.lsp.buf.definition()
        end
    end, bufopts)

    map("n", "gt", function()
        if not pcall(telescope_builtin.lsp_type_definitions) then
            vim.lsp.buf.type_definition()
        end
    end, bufopts)

    map("n", "gi", function()
        if not pcall(telescope_builtin.lsp_implementations) then
            vim.lsp.buf.implementation()
        end
    end, bufopts)

    map("n", "gr", function()
        if not pcall(telescope_builtin.lsp_references) then
            vim.lsp.buf.references()
        end
    end, bufopts)

    -- Mappings.
    map("n", "gD", vim.lsp.buf.declaration, bufopts)
    map("n", "K", vim.lsp.buf.hover, bufopts)
    map("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
end

-- Completion ------------------------------------------------------------------

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Servers ---------------------------------------------------------------------

local lsp = require("lspconfig")

-- C/C++
lsp.clangd.setup({
    -- cmd = { "clangd" },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- CSS
lsp.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Elixir
lsp.elixirls.setup({
    -- cmd = { "elixir-ls" },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Haskell
lsp.hls.setup({
    cmd = { "haskell-language-server-wrapper", "--lsp" }, -- From docs
    filetypes = { 'haskell', 'lhaskell', 'cabal' }, -- For version 1.9 or above
    on_attach = on_attach,
    capabilities = capabilities,
})

-- HTML
lsp.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Java
lsp.jdtls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Lua
lsp.lua_ls.setup({
    -- cmd = { "lua-language-server" },
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use" }
            }
        }
    },
    capabilities = capabilities,
})

-- CSharp
lsp.omnisharp.setup({
    -- cmd = { "omnisharp" },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Python
lsp.pyright.setup({
    -- cmd = { "pyright-langserver" },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- -- Rust
lsp.rust_analyzer.setup({
    -- cmd = { "rust-analyzer" },
    on_attach = on_attach,
    -- settings = {
    --     ["rust-analyzer"] = {},
    -- },
    capabilities = capabilities,
})

-- Typescript/Javascript
lsp.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
