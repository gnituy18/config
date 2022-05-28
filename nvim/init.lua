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
		run = ':TSUpdate',
		tag = 'nightly'
	}
	use 'tpope/vim-fugitive'
	use 'lewis6991/gitsigns.nvim'
	use {
		'phaazon/hop.nvim',
		branch = 'v1',
	}
	use { "ellisonleao/glow.nvim", branch = 'main' }
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use 'RRethy/vim-illuminate'
	use 'williamboman/nvim-lsp-installer'
	use 'neovim/nvim-lspconfig'
	use 'karb94/neoscroll.nvim'
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
		map('n', '<Space>hR', gs.reset_buffer)
		map('n', '<Space>hu', gs.undo_stage_hunk)
		map('n', '<Space>hp', gs.preview_hunk)
		map('n', '<Space>gb', function() gs.blame_line { full = true } end)
		-- map('n', '<Space>tb', gs.toggle_current_line_blame)
		map('n', '<Space>gd', gs.diffthis)
		-- map('n', '<Space>hD', function() gs.diffthis('~') end)
		-- map('n', '<Space>td', gs.toggle_deleted)

		-- Text object
		map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end
}

require 'hop'.setup {}

require 'neoscroll'.setup({
	mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
		'<C-y>', '<C-e>', 'zt', 'zz', 'zb', 'gg', 'G' },
})
-- vim.keymap.set('n', '<C-u>', function() require 'neoscroll'.scroll(-vim.wo.scroll, true, 50) end)
-- vim.keymap.set('n', '<C-d>', function() require 'neoscroll'.scroll(vim.wo.scroll, true, 50) end)
-- vim.keymap.set('n', '<C-b>', function() require 'neoscroll'.scroll(-vim.api.nvim_win_get_height(0), true, 50) end)
-- vim.keymap.set('n', '<C-f>', function() require 'neoscroll'.scroll(vim.api.nvim_win_get_height(0), true, 50) end)
-- vim.keymap.set('n', '<C-y>', function() require 'neoscroll'.scroll(-0.10, false, 100) end)
-- vim.keymap.set('n', '<C-e>', function() require 'neoscroll'.scroll(0.10, false, 100) end)
-- vim.keymap.set('n', 'zt', function() require 'neoscroll'.zt(50) end)
-- vim.keymap.set('n', 'zz', function() require 'neoscroll'.zz(50) end)
-- vim.keymap.set('n', 'zb', function() require 'neoscroll'.zb(50) end)
vim.keymap.set('n', 'gg', function() require 'neoscroll'.gg(30) end)
vim.keymap.set('n', 'G', function()
	print(vim.fn.line("w$"))
	local lines = require 'neoscroll.utils'.get_lines_below(vim.fn.line("w$"))
	local window_height = vim.api.nvim_win_get_height(0)
	local cursor_win_line = vim.fn.winline()
	local win_lines_below_cursor = window_height - cursor_win_line
	local corrected_time = math.floor(100 * (math.abs(lines) / (window_height / 2)) + 0.5)
	require 'neoscroll'.scroll(win_lines_below_cursor + lines - 5, true, corrected_time)
end)

require 'nvim-tree'.setup {
	filters = {
		dotfiles = false,
		custom = { '.DS_Store' },
	},
	git = {
		ignore = false,
	},
}

require('telescope').setup {
	defaults = {
		layout_strategy = 'vertical',
		layout_config = {
			vertical = {
				width = { padding = 2 },
				height = { padding = 1 },
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
}
require('telescope').load_extension('fzf')
vim.cmd [[highlight TelescopeSelection ctermbg=8 ctermfg=none cterm=none]]
vim.cmd [[highlight TelescopePreviewLine ctermbg=8 ctermfg=none cterm=none]]

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

vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]

local servers = { "gopls", "tsserver", "sumneko_lua", "jsonls", "cssls", "yamlls", "html", "svelte" }
local settings = {
	sumneko_lua = {
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
}

require "nvim-lsp-installer".setup({
	ensure_installed = servers,
	automatic_installation = true,
})


-- key mappings
for i = 1, 9 do
	vim.keymap.set("n", "<Space>" .. i, i .. "gt")
end

vim.keymap.set("n", "<Space>m", require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set("n", "<Space>,", require('telescope.builtin').find_files)
vim.keymap.set("n", "<Space>.", require('telescope.builtin').live_grep)
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

local on_attach = function(client, bufnr)
	require 'illuminate'.on_attach(client)

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
