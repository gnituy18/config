-- setting
vim.o.number = true
vim.o.cursorline = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamed"
vim.o.ignorecase = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.matchpairs = vim.o.matchpairs .. ",<:>"

-- colorscheme
vim.cmd("colorscheme mine")

-- plugins
require "packer".startup(function()
	use 'wbthomason/packer.nvim'
	use 'github/copilot.vim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'tpope/vim-fugitive'
	use 'lewis6991/gitsigns.nvim'
	use {
		'phaazon/hop.nvim',
		branch = 'v1',
	}
	use { "ellisonleao/glow.nvim", branch = 'main' }
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
	}
	use 'williamboman/nvim-lsp-installer'
	use 'neovim/nvim-lspconfig'
end)

require 'gitsigns'.setup {
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', ']c', function()
			if vim.wo.diff then return ']c' end
			vim.schedule(function() gs.next_hunk() end)
			return '<Ignore>'
		end, { expr = true })

		map('n', '[c', function()
			if vim.wo.diff then return '[c' end
			vim.schedule(function() gs.prev_hunk() end)
			return '<Ignore>'
		end, { expr = true })

		-- Actions
		map({ 'n', 'v' }, '<Space>hs', ':Gitsigns stage_hunk<CR>')
		map({ 'n', 'v' }, '<Space>hr', ':Gitsigns reset_hunk<CR>')
		map('n', '<Space>hS', gs.stage_buffer)
		map('n', '<Space>hu', gs.undo_stage_hunk)
		map('n', '<Space>hR', gs.reset_buffer)
		map('n', '<Space>hp', gs.preview_hunk)
		map('n', '<Space>b', function() gs.blame_line { full = true } end)
		map('n', '<Space>tb', gs.toggle_current_line_blame)
		map('n', '<Space>hd', gs.diffthis)
		map('n', '<Space>hD', function() gs.diffthis('~') end)
		map('n', '<Space>td', gs.toggle_deleted)

		-- Text object
		map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end
}

require 'hop'.setup {}

require 'nvim-tree'.setup {}

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

local servers = { "gopls", "tsserver", "sumneko_lua", "jsonls", "cssls", "yamlls", "html", "svelte" }
local settings = {
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					enable = true,
					globals = { "vim", "use", "hop" },
					disable = { "lowercase-global" }
				}
			}
		}
	}
}

require "nvim-lsp-installer".setup({
	ensure_installed = servers,
	automatic_installation = true,
})


-- key mappings
for i = 1, 9 do
	vim.keymap.set("n", "<Space>" .. i, i .. "gt")
end

vim.keymap.set("i", "<C-j>", "<C-x><C-o>")
vim.keymap.set("n", "<Space>q", "<Cmd>q!<CR>")
vim.keymap.set("n", "<Space>w", "<Cmd>w<CR>")
vim.keymap.set("n", "<Space>t", "<Cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<Space>/", "<Cmd>noh<CR>")
vim.keymap.set("i", "<C-n>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<C-p>", "<Plug>(copilot-previous)")
vim.keymap.set("n", "F", require 'hop'.hint_words)
vim.keymap.set("n", "f", function() require 'hop'.hint_char1({ current_line_only = true }) end)

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Space>d", function() vim.diagnostic.open_float(nil, { focusable = false }) end, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local aopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, aopts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, aopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, aopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, aopts)
	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, aopts)

	vim.keymap.set('n', 'K', vim.lsp.buf.hover, aopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, aopts)

	vim.keymap.set('n', '<Space>r', vim.lsp.buf.rename, aopts)
	vim.keymap.set('n', '<Space>a', vim.lsp.buf.code_action, aopts)
	vim.keymap.set('n', '<Space>f', vim.lsp.buf.formatting, aopts)

	vim.keymap.set('n', '<Space>wa', vim.lsp.buf.add_workspace_folder, aopts)
	vim.keymap.set('n', '<Space>wr', vim.lsp.buf.remove_workspace_folder, aopts)
	vim.keymap.set('n', '<Space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, aopts)
end

for _, server in ipairs(servers) do
	if settings[server] then
		require "lspconfig"[server].setup {
			on_attach = on_attach,
			settings = settings[server].settings
		}
	else
		require "lspconfig"[server].setup {
			on_attach = on_attach,
		}
	end
end
