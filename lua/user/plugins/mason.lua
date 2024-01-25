require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",               -- C/C++
        "cssls",                -- CSS
        "html",                 -- HTML
        "jdtls",                -- Java (Eclipse)
        "lua_ls",               -- Lua
        "omnisharp",            -- CSharp
        "pyright",              -- Python
        "rust_analyzer",        -- Rust
        "tsserver",             -- Typescript/Javascript
    }
    --"elixirls",             -- Elixir
    --"hls",                  -- Haskell
    --"java_language_server", -- Java
})
