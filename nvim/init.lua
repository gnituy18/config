vim.o.number = true
vim.o.cursorline = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.mouse = "a"
vim.o.clipboard = "unnamed"
vim.o.smartcase = true

vim.cmd "colorscheme cs"

vim.keymap.set("n", "<Space>q", "<Cmd>q!<CR>")
vim.keymap.set("n", "<Space>Q", "<Cmd>qa!<CR>")
vim.keymap.set("n", "<Space>w", "<Cmd>w<CR>")
vim.keymap.set("n", "<Space>W", "<Cmd>wa<CR>")

for i = 1, 9 do
	vim.keymap.set("n", "<Space>" .. i, i .. "gt")
end

require "packer".startup(function()
	-- packer
	use 'wbthomason/packer.nvim'

	-- information
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use "lewis6991/gitsigns.nvim"
	use "lukas-reineke/indent-blankline.nvim"

	-- moving
	use "declancm/cinnamon.nvim"
	use "ibhagwan/fzf-lua"
	use "phaazon/hop.nvim"

	-- productivity
	use "github/copilot.vim"
	use "neovim/nvim-lspconfig"
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/nvim-cmp"
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"
	use "hrsh7th/cmp-nvim-lsp-signature-help"
end)

require "nvim-treesitter.configs".setup {
	ensure_installed = "all",
	indent = {
		enable = true
	}
}

require "gitsigns".setup {
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]h", function()
			if vim.wo.diff then return "]h" end
			vim.schedule(function() gs.next_hunk() end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[h", function()
			if vim.wo.diff then return "[h" end
			vim.schedule(function() gs.prev_hunk() end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "<Space>hs", gs.stage_hunk)
		map("n", "<Space>hS", gs.stage_buffer)
		map("n", "<Space>hr", gs.reset_hunk)
		map("n", "<Space>hR", gs.reset_buffer)
		map("n", "<Space>hU", gs.reset_buffer_index)
		map("n", "<Space>hp", gs.preview_hunk)
		map("n", "<Space>gb", gs.blame_line)
	end
}

vim.g.indent_blankline_filetype = { "json", "yaml" }
vim.cmd "hi IndentBlanklineChar ctermfg=8"

require "cinnamon".setup {
	extra_keymaps = true,
	extended_keymaps = true,
	override_keymaps = true,
	default_delay = 1
}

require "fzf-lua".setup {
	winopts = {
		border     = 'none',
		fullscreen = true,
		preview    = {
			vertical     = 'up:50%',
			horizontal   = 'right:50%',
			flip_columns = 150,
		}
	}
}
vim.keymap.set("n", "<Space>j", require "fzf-lua".buffers)
vim.keymap.set("n", "<Space>k", require "fzf-lua".files)
vim.keymap.set("n", "<Space>l", require "fzf-lua".live_grep)

require "hop".setup {}
vim.keymap.set("n", "f", require "hop".hint_char1)

vim.keymap.set("i", "]c", "<Plug>(copilot-next)")
vim.keymap.set("i", "[c", "<Plug>(copilot-previous)")

local servers = { "rust_analyzer", "gopls", "tsserver", "sumneko_lua", "jsonls", "cssls", "yamlls", "html", "svelte" }
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

require "mason".setup()
require "mason-lspconfig".setup {
	ensure_installed = servers,
	automatic_installation = true,
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Space>d", function() vim.diagnostic.open_float(nil, { focusable = false }) end, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", function() require "fzf-lua".lsp_definitions({ jump_to_single_result = true }) end, bufopts)
	vim.keymap.set("n", "gD", function() require "fzf-lua".lsp_declarations({ jump_to_single_result = true }) end, bufopts)
	vim.keymap.set("n", "gi", function() require "fzf-lua".lsp_implementations({ jump_to_single_result = true }) end,
		bufopts)
	vim.keymap.set("n", "gr", function() require "fzf-lua".lsp_references({ jump_to_single_result = true }) end, bufopts)
	vim.keymap.set("n", "gt", function() require "fzf-lua".lsp_typedefs({ jump_to_single_result = true }) end, bufopts)

	vim.keymap.set("n", "<Space>h", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<Space>s", vim.lsp.buf.signature_help, bufopts)

	vim.keymap.set("n", "<Space>r", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<Space>a", require "fzf-lua".lsp_code_actions, bufopts)
	vim.keymap.set("n", "<Space>f", function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require "cmp_nvim_lsp".default_capabilities()

for _, server in ipairs(servers) do
	require "lspconfig"[server].setup {
		on_attach = on_attach,
		settings = settings[server] and settings[server].settings or nil,
		capabilities = capabilities,
	}
end

require "cmp".setup({
	snippet = {
		expand = function(args)
			require "luasnip".lsp_expand(args.body)
		end,
	},
	mapping = require "cmp".mapping.preset.insert({
		['<C-b>'] = require "cmp".mapping.scroll_docs(-4),
		['<C-f>'] = require "cmp".mapping.scroll_docs(4),
		['<C-j>'] = require "cmp".mapping.complete(),
		['<C-e>'] = require "cmp".mapping.abort(),
		['<CR>'] = require "cmp".mapping.confirm(),
	}),
	sources = require "cmp".config.sources({
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
	})
})
