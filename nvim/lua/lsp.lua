lsp = require "lspconfig"
lspfuzzy = require "lspfuzzy"

lspfuzzy.setup {jump_one = false}
lsp.svelte.setup {}
lsp.tsserver.setup {}
lsp.gopls.setup {}
vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
