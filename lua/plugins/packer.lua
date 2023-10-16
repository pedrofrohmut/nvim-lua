-- Safe require
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Error to require Packer. Check the config")
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- LSP Config
    use "neovim/nvim-lspconfig"
    use "ray-x/lsp_signature.nvim"

    -- Language Servers
    use { "williamboman/mason.nvim", run = ":MasonUpdate" }
    use "williamboman/mason-lspconfig.nvim"

    -- Formatter
    use "jose-elias-alvarez/null-ls.nvim"

    -- Language Support
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "maxmellon/vim-jsx-pretty"
    -- use "nvim-treesitter/nvim-treesitter-textobjects"
    -- use "elixir-editors/vim-elixir"

    -- Completion
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/nvim-cmp"

    -- Snips
    use "mattn/emmet-vim"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    -- Symbols (Tagbar)
    use "simrat39/symbols-outline.nvim"

    -- Required for Telescope
    use "nvim-lua/plenary.nvim"

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    }

    -- Tree file explorer
    use "preservim/nerdtree"

    -- Jump plugin like small version of easy motion
    use "justinmk/vim-sneak"

    -- Auto Pairs
    use "alvan/vim-closetag"
    use "windwp/nvim-autopairs"

    -- EditorConfig
    -- use "editorconfig/editorconfig-vim"

    -- Surrounder for Simple Stuff
    use "tpope/vim-surround"

    -- Dot command now works with some plugins too
    use "tpope/vim-repeat"

    -- Commenter
    use "tomtom/tcomment_vim"

    -- Aligner
    use "tommcdo/vim-lion"

    -- Git gutter
    use "airblade/vim-gitgutter"

    -- Status Line
    use "nvim-lualine/lualine.nvim"

    -- Color Schemes (comment it out the one you like be not using)
    use "sainnhe/sonokai"
    -- use "mhartington/oceanic-next"
    -- use "jacoborus/tender.vim"
    -- use "folke/tokyonight.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require("packer").sync()
    end
end)
