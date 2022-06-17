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
	use 'nvim-lua/plenary.nvim'

	-- editor
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'RRethy/vim-illuminate'
	use 'luukvbaal/nnn.nvim'
	use 'ibhagwan/fzf-lua'
	use 'phaazon/hop.nvim'
	use 'declancm/cinnamon.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use "lukas-reineke/indent-blankline.nvim"
	use "tversteeg/registers.nvim"

	-- git
	use 'tpope/vim-fugitive'
	use 'lewis6991/gitsigns.nvim'

	-- productivity
	use 'williamboman/nvim-lsp-installer'
	use 'neovim/nvim-lspconfig'
	use { "ellisonleao/glow.nvim", branch = 'main' }
	use 'github/copilot.vim'

end)

require "nvim-treesitter.configs".setup {
	ensure_installed = "all",
	highlight = {
		enable = true
	}
}

vim.keymap.set("n", "<C-n>", function() require 'illuminate'.next_reference { wrap = true } end)
vim.keymap.set("n", "<C-p>", function() require 'illuminate'.next_reference { reverse = true, wrap = true } end)

require 'nnn'.setup {
	replace_netrw = "explorer",
	explorer = {
		cmd = "nnn",
		width = 32,
		side = "topleft",
		session = "global",
		tabs = true,
	},
	mappings = {
		{ "<C-t>", require 'nnn'.builtin.open_in_tab },
		{ "<C-s>", require 'nnn'.builtin.open_in_split },
		{ "<C-v>", require 'nnn'.builtin.open_in_vsplit },
	},
	windownav = {
		left = "<C-w>h",
		right = "<C-w>l",
		next = "<C-w>w",
		prev = "<C-w>W",
	},
}
vim.keymap.set("n", "<Space>j", "<Cmd>NnnExplorer %:p:h<CR>")

require 'fzf-lua'.setup {
	winopts = {
		preview = {
			vertical = 'up:50%',
			layout   = "vertical",
		}
	}
}
vim.keymap.set("n", "<Space>k", require 'fzf-lua'.files)
vim.keymap.set("n", "<Space>l", require 'fzf-lua'.live_grep)
vim.keymap.set("n", "<Space>;", require 'fzf-lua'.buffers)

require 'hop'.setup {}
vim.keymap.set("n", "<Space>f", require 'hop'.hint_words)

require 'cinnamon'.setup {
	extra_keymaps = true,
	extended_keymaps = true,
	scroll_limit = 300,
	default_delay = 1
}

vim.api.nvim_command [[ hi IndentBlanklineChar ctermfg=8 ]]
vim.g.indent_blankline_filetype = { 'json', 'yaml' }

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

vim.keymap.set("i", "<C-j>", "<C-x><C-o>")
vim.keymap.set("n", "<Space>q", "<Cmd>q!<CR>")
vim.keymap.set("n", "<Space>Q", "<Cmd>qa!<CR>")
vim.keymap.set("n", "<Space>w", "<Cmd>w<CR>")
vim.keymap.set("n", "<Space>W", "<Cmd>wa<CR>")
vim.keymap.set("i", "<C-n>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<C-p>", "<Plug>(copilot-previous)")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Space>d", function() vim.diagnostic.open_float(nil, { focusable = false }) end, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

local on_attach = function(client, bufnr)
	require 'illuminate'.on_attach(client)

	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local aopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gd', function() require 'cinnamon.scroll'.scroll('definition') end, aopts)
	vim.keymap.set('n', 'gD', function() require 'cinnamon.scroll'.scroll('declaration') end, aopts)
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
