lsp = require "lspconfig"
lspfuzzy = require "lspfuzzy"

vim.g.fzf_preview_window = {"up,20"}
vim.g.fzf_layout = {down = 40}

lspfuzzy.setup {jump_one = false}

lsp.svelte.setup {}
lsp.tsserver.setup {}
lsp.yamlls.setup {}
lsp.gopls.setup {}
vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
