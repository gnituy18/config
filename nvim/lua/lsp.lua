installer = require "nvim-lsp-installer"
lsp = require "lspconfig"
lspfuzzy = require "lspfuzzy"

installer.setup({
	ensure_installed = { "gopls", "tsserver", "sumneko_lua", "yamlls", "svelte" },
	automatic_installation = true,
})

lspfuzzy.setup { jump_one = false }

lsp.gopls.setup {}
lsp.sumneko_lua.setup {
	settings = {
		Lua = {
			diagnostics = {
				enable = true,
				globals = { "vim" },
				disable = { "lowercase-global" }
			}
		}
	}
}
lsp.html.setup {}
lsp.jsonls.setup {}
lsp.tsserver.setup {}
lsp.svelte.setup {}

vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
