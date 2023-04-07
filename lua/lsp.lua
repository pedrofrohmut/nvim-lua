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

    local ok_telescope, builtin = pcall(require, "telescope.builtin")
    -- TODO: make telescope the default and regular vim the fallback instead of having both
    if ok_telescope then
        map("n", "gd", function()
            if not pcall(builtin.lsp_definitions) then
                vim.lsp.buf.definition()
            end
        end, bufopts)

        map("n", "gt", function()
            if not pcall(builtin.lsp_type_definitions) then
                vim.lsp.buf.type_definition()
            end
        end, bufopts)

        map("n", "gh", function()
            if not pcall(builtin.lsp_implementations) then
                vim.lsp.buf.implementation()
            end
        end, bufopts)

        map("n", "gr", function()
            if not pcall(builtin.lsp_references) then
                vim.lsp.buf.references()
            end
        end, bufopts)
    else
        print("Could not import Telescope Builtin")
    end

    -- map("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
    -- map("n", "<leader>gt", vim.lsp.buf.type_definition, bufopts)
    -- map("n", "<leader>gh", vim.lsp.buf.implementation, bufopts) -- gi is too awesome not replace
    -- map("n", "<leader>gr", vim.lsp.buf.references, bufopts)

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
    cmd = { "clangd" },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Elixir
lsp.elixirls.setup({
    cmd = { "elixir-ls" },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- CSharp
lsp.omnisharp.setup({
    cmd = { "omnisharp" },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Python
lsp.pyright.setup({
    cmd = { "pyright-langserver" },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- -- Rust
lsp.rust_analyzer.setup({
    cmd = { "rust-analyzer" },
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {},
    },
    capabilities = capabilities,
})

-- -- Lua
lsp.lua_ls.setup({
    cmd = { "lua-language-server" },
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

-- Typescript/Javascript
lsp.tsserver.setup({
    cmd = { "typescript-language-server" },
    on_attach = on_attach,
    capabilities = capabilities,
})
