lsp = require "lspconfig"
lspfuzzy = require "lspfuzzy"

lspfuzzy.setup {jump_one = false}

lsp.gopls.setup {}
lsp.sumneko_lua.setup{}
lsp.html.setup {}
lsp.jsonls.setup{}
lsp.tsserver.setup {}
lsp.svelte.setup {}

vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
