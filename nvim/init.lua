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

vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
  "https://github.com/karb94/neoscroll.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://codeberg.org/andyg/leap.nvim",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/hrsh7th/cmp-cmdline",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol",
  "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-vsnip",
  "https://github.com/hrsh7th/vim-vsnip",
  "https://github.com/gnituy18/tmplx.nvim",
})

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevelstart = 99

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
require("fzf-lua").register_ui_select()
vim.keymap.set("n", "<Space>j", require("fzf-lua").lgrep_curbuf)
vim.keymap.set("n", "<Space>k", require("fzf-lua").files)
vim.keymap.set("n", "<Space>l", require("fzf-lua").live_grep)

vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')

local servers = { "clangd", "gopls", "lua_ls", "ts_ls", "html", "tailwindcss", "yamlls", "jsonls" }

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers,
})

vim.keymap.set("n", "<Space>d", function() vim.diagnostic.open_float(nil, { focusable = false }) end,
  { noremap = true, silent = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = function(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", function() require("fzf-lua").lsp_definitions({ jump1 = true }) end,
        bufopts)
      vim.keymap.set("n", "gD", function() require("fzf-lua").lsp_declarations({ jump1 = true }) end,
        bufopts)
      vim.keymap.set("n", "gi", function() require("fzf-lua").lsp_implementations({ jump1 = true }) end,
        bufopts)
      vim.keymap.set("n", "gr", function() require("fzf-lua").lsp_references({ jump1 = true }) end,
        bufopts)
      vim.keymap.set("n", "gt", function() require("fzf-lua").lsp_typedefs({ jump1 = true }) end,
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
  sources = require("cmp").config.sources(
    {
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

vim.keymap.set("n", "<Space>p", function()
  local folder = vim.fn.getcwd() .. "/.clipboard"
  local files = vim.fn.globpath(folder, "*", false, true)

  local items = {}
  for _, file in ipairs(files) do
    table.insert(items, vim.fn.fnamemodify(file, ":t"))
  end

  vim.ui.select(items, { prompt = "Select snippet:" }, function(choice)
    if choice then
      local content = vim.fn.readfile(folder .. "/" .. choice)
      vim.api.nvim_put(content, "l", true, true)
    end
  end)
end)
