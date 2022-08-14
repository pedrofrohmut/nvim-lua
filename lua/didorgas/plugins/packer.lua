local status_ok, packer = pcall(require, "packer")
if not status_ok then
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
    use 'folke/tokyonight.nvim'

    -- CMP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    -- Snips for CMP
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
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
end)
