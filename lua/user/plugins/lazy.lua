local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

local plugins = {
    -- LSP Config
    { "neovim/nvim-lspconfig" },
    --use "ray-x/lsp_signature.nvim"

    -- Language Servers
    { "williamboman/mason.nvim", build = ":MasonUpdate" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Formatter & Linter
    { "dense-analysis/ale" },

    -- Language Support
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "maxmellon/vim-jsx-pretty" },
    -- use "nvim-treesitter/nvim-treesitter-textobjects"
    -- use "elixir-editors/vim-elixir"

    -- Completion
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/nvim-cmp" },

    -- Snips
    { "mattn/emmet-vim" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },

    -- Symbols (Tagbar)
    { "simrat39/symbols-outline.nvim" },

    -- Required for Telescope
    { "nvim-lua/plenary.nvim" },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- Tree file explorer
    { "preservim/nerdtree" },

    -- Jump plugin like small version of easy motion
    { "justinmk/vim-sneak" },

    -- Auto Pairs
    { "windwp/nvim-autopairs" },

    -- EditorConfig
    { "editorconfig/editorconfig-vim" },

    -- Surrounder for Simple Stuff
    { "tpope/vim-surround" },

    -- Dot command now works with some plugins too
    { "tpope/vim-repeat" },

    -- Commenter
    { "tomtom/tcomment_vim" },

    -- Aligner
    { "tommcdo/vim-lion" },

    -- Git gutter
    { "airblade/vim-gitgutter" },

    -- Status Line
    { "nvim-lualine/lualine.nvim" },

    -- Color Schemes (comment it out the one you like be not using)
    { "sainnhe/sonokai" },
    -- use "mhartington/oceanic-next"
    -- use "jacoborus/tender.vim"
    -- use "folke/tokyonight.nvim"
}

require("lazy").setup(plugins, opts)
