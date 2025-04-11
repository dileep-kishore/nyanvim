require 'nyanvim.options'
require 'nyanvim.keymaps.keymaps'

-- NOTE: Register another one from lzextras. This one makes it so that
-- you can set up lsps within lze specs,
-- and trigger lspconfig setup hooks only on the correct filetypes
require('lze').register_handlers(require('lzextras').lsp)

require 'nyanvim.themes'
require 'nyanvim.lsps'
require 'nyanvim.completions'
require 'nyanvim.treesitter'
require 'nyanvim.plugins'
require 'nyanvim.ui'
require 'nyanvim.bars'
require 'nyanvim.ai'
require 'nyanvim.literate'
require 'nyanvim.misc'

require 'nyanvim.keymaps'
