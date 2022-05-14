require "packer".startup(function()
	use 'wbthomason/packer.nvim'
	use 'lewis6991/gitsigns.nvim'
	use {
		'phaazon/hop.nvim',
		branch = 'v1',
	}
	use 'williamboman/nvim-lsp-installer'
	use 'neovim/nvim-lspconfig'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use { "ellisonleao/glow.nvim", branch = 'main' }
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
	}
	use 'github/copilot.vim'
end)

require 'gitsigns'.setup {}

require 'nvim-tree'.setup {
	open_on_setup = true,
	hijack_cursor = true,
	update_cwd = true,
	view = {
		auto_resize = true,
	}
}

require "nvim-treesitter.configs".setup {
	ensure_installed = "all",
	highlight = {
		enable = true
	},
	incremental_selection = {
		enable = true
	},
	indent = {
		enable = true
	}
}

installer = require "nvim-lsp-installer"
lsp = require "lspconfig"

installer.setup({
	ensure_installed = { "gopls", "tsserver", "sumneko_lua", "yamlls", "svelte" },
	automatic_installation = true,
})

lsp.gopls.setup {}
lsp.sumneko_lua.setup {
	settings = {
		Lua = {
			diagnostics = {
				enable = true,
				globals = { "vim", "use" },
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

-- setting
vim.g.mapleader = " "
vim.g.loaded_matchparen = 1
vim.o.updatetime = 300
vim.o.mouse = "a"
vim.o.clipboard = "unnamed"
vim.o.ignorecase = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.matchpairs = vim.o.matchpairs .. ",<:>"
vim.o.omnifunc = "v:lua.vim.lsp.omnifunc"
vim.o.completeopt = "menu"
vim.wo.cursorline = true
vim.wo.number = true

vim.cmd("colorscheme mine")

vim.diagnostic.config({
	virtual_text = { prefix = "" },
})

-- replace f with easymotion-overwin-f
vim.keymap.set("n", "f", "<Plug>(easymotion-overwin-f)")

-- editor
vim.keymap.set("n", "<Leader>q", "<Cmd>q!<CR>")
vim.keymap.set("n", "<Leader>w", "<Cmd>w<CR>")
vim.keymap.set("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>")

-- helper
vim.keymap.set("n", "<Leader>a", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<Leader>s", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>")
vim.keymap.set("n", "<Leader>d", "<Cmd>lua vim.diagnostic.open_float(nil, {focusable=false})<CR>")
vim.keymap.set("n", "<Leader>f", "<Cmd>lua vim.lsp.buf.formatting(nil)<CR>")
vim.keymap.set("n", "<Leader>h", "<Cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("i", "<C-j>", "<C-x><C-o>")

-- jumping
vim.keymap.set("n", "<Leader>j", "<Cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<Leader>k", "<Cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "<Leader>l", "<Cmd>lua vim.lsp.buf.implementation()<CR>")

-- search
vim.keymap.set("n", "<Leader>,", "<Cmd>Rg<CR>")
vim.keymap.set("n", "<Leader>.", "<Cmd>Files<CR>")
vim.keymap.set("n", "<Leader>/", "<Cmd>noh<CR>")

-- tabs
for i = 1, 9 do
	vim.keymap.set("n", "<Leader>" .. i, i .. "gt")
end
