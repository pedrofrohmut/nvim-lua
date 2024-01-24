--[[
    This configuration is based on:
        1. Neovim from scratch by chris@machine
        2. The Primeagen videos
        3. My own vim configuration with vimscript
        4. Tj DeVries yt-channel
        5. For the plugins theirs respective Readmes and help
]]--

require "user.plugins.lazy"

require "user.autocmds"
require "user.colors"
require "user.keymaps"
require "user.lsp"
require "user.options"
require "user.treesitter"

--require "user.plugins.lsp-signature"
require "user.plugins.ale"
require "user.plugins.autopairs"
require "user.plugins.cmp"
require "user.plugins.emmet"
require "user.plugins.jsx-prettier"
require "user.plugins.lualine"
require "user.plugins.luasnip"
require "user.plugins.mason"
require "user.plugins.nerdtree"
require "user.plugins.sneak"
require "user.plugins.surround"
require "user.plugins.symbols-outline"
require "user.plugins.tcomment"
require "user.plugins.telescope"

require "user.utils.runners"
