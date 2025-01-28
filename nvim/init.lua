vim.cmd.colorscheme("hsuyuting")

vim.o.number = true
vim.o.cursorline = true
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.ERROR] = '',
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    },
  },
  virtual_text = {
    prefix = '🚨',
  }
})

for i = 1, 9 do
  vim.keymap.set("n", "<Space>" .. i, i .. "gt")
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-treesitter/nvim-treesitter",     build = ":TSUpdate" },
  "lewis6991/gitsigns.nvim",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",       opts = {}, },
  "karb94/neoscroll.nvim",
  "ibhagwan/fzf-lua",
  "ggandor/leap.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
}, {
  ui = {
    border = "rounded",
    icons = {
      source = "📄",
      start = "🟢",
      lazy = "💤 ",
    }
  }
})

require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true },
})

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevelstart = 99

vim.treesitter.language.register('html', 'tmpl')

require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']h', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gs.nav_hunk('next')
      end
    end)

    map('n', '[h', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gs.nav_hunk('prev')
      end
    end)

    -- Actions
    map("n", "<Space>hs", gs.stage_hunk)
    map("n", "<Space>hr", gs.reset_hunk)
    map("n", "<Space>hp", gs.preview_hunk)
    map("n", "<Space>gb", function()
      gs.blame_line({ full = true })
    end)
    map('n', '<Space>td', gs.toggle_deleted)
    map('n', '<Space>hd', gs.diffthis)
  end
})

require("ibl").setup()

require("neoscroll").setup()

require "fzf-lua".setup()
vim.keymap.set("n", "<Space>j", require("fzf-lua").jumps)
vim.keymap.set("n", "<Space>k", require("fzf-lua").files)
vim.keymap.set("n", "<Space>l", require("fzf-lua").live_grep)

require("leap").add_default_mappings()

local servers = { "rust_analyzer", "gopls", "lua_ls", "ts_ls", "html", "tailwindcss", "cssls", "yamlls", "jsonls",
  "intelephense", "volar" }

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

vim.keymap.set("n", "<Space>d", function() vim.diagnostic.open_float(nil, { focusable = false }) end,
  { noremap = true, silent = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })

for _, server in ipairs(servers) do
  require("lspconfig")[server].setup({
    on_attach = function(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", function() require("fzf-lua").lsp_definitions({ jump_to_single_result = true }) end,
        bufopts)
      vim.keymap.set("n", "gD", function() require("fzf-lua").lsp_declarations({ jump_to_single_result = true }) end,
        bufopts)
      vim.keymap.set("n", "gi", function() require("fzf-lua").lsp_implementations({ jump_to_single_result = true }) end,
        bufopts)
      vim.keymap.set("n", "gr", function() require("fzf-lua").lsp_references({ jump_to_single_result = true }) end,
        bufopts)
      vim.keymap.set("n", "gt", function() require("fzf-lua").lsp_typedefs({ jump_to_single_result = true }) end,
        bufopts)

      vim.keymap.set("n", "<Space>h", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "<Space>s", vim.lsp.buf.signature_help, bufopts)

      vim.keymap.set("n", "<Space>r", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<Space>a", require("fzf-lua").lsp_code_actions, bufopts)
      vim.keymap.set("n", "<Space>f", function() vim.lsp.buf.format { async = true } end, bufopts)
    end,

    capabilities = require("cmp_nvim_lsp").default_capabilities()
  })
end

require("cmp").setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  preselect = require("cmp").PreselectMode.None,
  window = {
    completion = require("cmp").config.window.bordered(),
    documentation = require("cmp").config.window.bordered(),
  },
  mapping = require("cmp").mapping.preset.insert({
    ["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
    ["<C-f>"] = require("cmp").mapping.scroll_docs(4),
    ["<C-k>"] = require("cmp").mapping.complete(),
    ["<C-e>"] = require("cmp").mapping.abort(),
    ["<CR>"] = require("cmp").mapping.confirm(),
  }),
  sources = require("cmp").config.sources({
      { name = "nvim_lsp_signature_help" },
    }, {
      { name = "nvim_lsp" },
      { name = "vsnip" },
    },
    {
      { name = "buffer" },
    })
})

require("cmp").setup.cmdline({ '/', '?' }, {
  mapping = require("cmp").mapping.preset.cmdline(),
  sources = require("cmp").config.sources({
    { name = "nvim_lsp_document_symbol" },
  }, {
    { name = 'buffer' },
  })
})

require("cmp").setup.cmdline(':', {
  mapping = require("cmp").mapping.preset.cmdline(),
  sources = require("cmp").config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false },
})
