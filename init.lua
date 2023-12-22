--[[
    This configuration is based on:
        1. Neovim from scratch by chris@machine
        2. The Primeagen videos
        3. My own vim configuration with vimscript
        4. Tj DeVries yt-channel
        5. For the plugins theirs respective Readmes and help
]]--

require "autocmds"
require "colors"
require "keymaps"
require "lsp"
require "options"
require "treesitter"

require "plugins.autopairs"
require "plugins.closetag"
require "plugins.cmp"
require "plugins.emmet"
require "plugins.jsx-prettier"
--require "plugins.lsp-signature"
require "plugins.lualine"
require "plugins.luasnip"
require "plugins.mason"
require "plugins.nerdtree"
require "plugins.null-ls"
require "plugins.packer"
require "plugins.sneak"
require "plugins.surround"
require "plugins.symbols-outline"
require "plugins.tcomment"
require "plugins.telescope"

require "utils.runners"
