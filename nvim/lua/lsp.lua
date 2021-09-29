lsp = require "lspconfig"
lspfuzzy = require "lspfuzzy"


lspfuzzy.setup {}
lsp.gopls.setup {}
lsp.tsserver.setup {}
vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
