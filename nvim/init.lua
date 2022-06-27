vim.o.number = true
vim.o.cursorline = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamed"
vim.o.ignorecase = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.matchpairs = vim.o.matchpairs .. ",<:>"

vim.cmd "colorscheme mine"

require "packer".startup(function()
	use 'wbthomason/packer.nvim'

	-- editor
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'phaazon/hop.nvim'
	use 'ibhagwan/fzf-lua'
	use 'declancm/cinnamon.nvim'
	use "lukas-reineke/indent-blankline.nvim"

	-- git
	use 'lewis6991/gitsigns.nvim'

	-- productivity
	use 'williamboman/nvim-lsp-installer'
	use 'neovim/nvim-lspconfig'
	use 'github/copilot.vim'
end)

require "nvim-treesitter.configs".setup {
	ensure_installed = "all",
	highlight = {
		enable = true
	}
}

require 'fzf-lua'.setup {
	winopts = {
		border     = 'none',
		fullscreen = true,
		preview    = {
			vertical     = 'up:50%',
			horizontal   = 'right:50%',
			flip_columns = 150,
			scrollbar    = false,
		}
	}
}
vim.keymap.set("n", "<Space>j", require 'fzf-lua'.buffers)
vim.keymap.set("n", "<Space>k", require 'fzf-lua'.files)
vim.keymap.set("n", "<Space>l", require 'fzf-lua'.live_grep)

require 'hop'.setup {}
vim.keymap.set("n", "f", require 'hop'.hint_char1)

require 'cinnamon'.setup {
	extra_keymaps = true,
	extended_keymaps = true,
	scroll_limit = 100,
	default_delay = 1
}

vim.g.indent_blankline_filetype = { 'json', 'yaml' }
vim.cmd 'hi IndentBlanklineChar ctermfg=8'

vim.cmd 'hi GitSignsAddInline ctermbg=2 ctermfg=0'
vim.cmd 'hi GitSignsChangeInline ctermbg=11 ctermfg=0'
vim.cmd 'hi GitSignsDeleteInline ctermbg=1 ctermfg=0'
-- TODO remove this: https://github.com/lewis6991/gitsigns.nvim/issues/582
vim.cmd 'hi link GitSignsDeleteLn DiffDelete'

require 'gitsigns'.setup {
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', ']h', function()
			if vim.wo.diff then return ']h' end
			vim.schedule(function() gs.next_hunk() end)
			return '<Ignore>'
		end, { expr = true })

		map('n', '[h', function()
			if vim.wo.diff then return '[h' end
			vim.schedule(function() gs.prev_hunk() end)
			return '<Ignore>'
		end, { expr = true })

		-- Actions
		map('n', '<Space>hs', gs.stage_hunk)
		map('n', '<Space>hr', gs.reset_hunk)
		map('n', '<Space>hS', gs.stage_buffer)
		map('n', '<Space>hR', gs.reset_buffer)
		map('n', '<Space>hU', gs.reset_buffer_index)
		map('n', '<Space>hp', gs.preview_hunk)
		map('n', '<Space>gb', gs.blame_line)
	end
}

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
vim.keymap.set("i", "]c", "<Plug>(copilot-next)")
vim.keymap.set("i", "[c", "<Plug>(copilot-previous)")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Space>d", function() vim.diagnostic.open_float(nil, { focusable = false }) end, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local aopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gd', require 'fzf-lua'.lsp_definitions, aopts)
	vim.keymap.set('n', 'gD', require 'fzf-lua'.lsp_declarations, aopts)
	vim.keymap.set('n', 'gi', require 'fzf-lua'.lsp_implementations, aopts)
	vim.keymap.set('n', 'gr', require 'fzf-lua'.lsp_references, aopts)
	vim.keymap.set('n', 'gt', require 'fzf-lua'.lsp_typedefs, aopts)

	vim.keymap.set('n', '<Space>h', vim.lsp.buf.hover, aopts)
	vim.keymap.set('n', '<Space>s', vim.lsp.buf.signature_help, aopts)

	vim.keymap.set('n', '<Space>r', vim.lsp.buf.rename, aopts)
	vim.keymap.set('n', '<Space>a', require 'fzf-lua'.lsp_code_actions, aopts)
	vim.keymap.set('n', '<Space>f', vim.lsp.buf.formatting, aopts)
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
