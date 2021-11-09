lsp = require "lspconfig"
lspfuzzy = require "lspfuzzy"

lspfuzzy.setup {}
vim.g.fzf_preview_window = {'up:+{2}-/2'}
lsp.svelte.setup{}
lsp.tsserver.setup {}
lsp.yamlls.setup{}
lsp.gopls.setup {}
vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
