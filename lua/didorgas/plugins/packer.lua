-- Install packer if not found in the default folder
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
end

-- PackerSync onThisFileSave
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]])

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

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- CMP: Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    -- Snippets for CMP [Required]
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- LSP neovim lsp and mason for install servers
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Telescope
    use 'nvim-lua/plenary.nvim' -- Required for Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Tree File Explorer
    use 'preservim/nerdtree'

    -- Snippets made by community
    use 'rafamadriz/friendly-snippets'

    -- Jump plugin like small version of easy motion
    use 't9md/vim-smalls'

    -- Emmet - HTML JSX snippets
    use 'mattn/emmet-vim'

    -- Auto close HTML tags
    use 'alvan/vim-closetag'

    -- EditorConfig
    use 'editorconfig/editorconfig-vim'

    -- Surrounder for Simple Stuff
    use 'tpope/vim-surround'
    -- Dot command now works with some plugins too
    use 'tpope/vim-repeat'

    -- Commenter
    use 'tomtom/tcomment_vim'

    -- Git gutter
    use 'airblade/vim-gitgutter'

    -- Color Schemes
    use 'mhartington/oceanic-next'
    use 'jacoborus/tender.vim'
    use 'dikiaap/minimalist'
    use 'folke/tokyonight.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
