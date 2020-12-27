lsp = require "lspconfig"
lspfuzzy = require "lspfuzzy"


lsp.gopls.setup {}
lspfuzzy.setup {}
vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
