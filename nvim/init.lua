vim.cmd.colorscheme("default")
vim.o.number = true
vim.o.cursorline = true
vim.o.tabstop = 4

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
  virtual_text = false,
  virtual_lines = { current_line = true },
})

vim.o.foldlevelstart = 99
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "yaml", "html", "go" },
  callback = function() vim.treesitter.start() end,
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
  "https://github.com/ray-x/lsp_signature.nvim",
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/hrsh7th/cmp-cmdline",
  "https://github.com/gnituy18/tmplx.nvim",
})

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

local servers = { "clangd", "gopls", "lua_ls", "html", "yamlls", "jsonls" }

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers,
})

vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { noremap = true, silent = true })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { noremap = true, silent = true })

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
      vim.keymap.set("n", "<Space>s", function() require("lsp_signature").toggle_float_win() end, bufopts)

      vim.keymap.set("n", "<Space>r", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<Space>a", require("fzf-lua").lsp_code_actions, bufopts)
      vim.keymap.set("n", "<Space>f", function() vim.lsp.buf.format { async = true } end, bufopts)
      vim.keymap.set("n", "<Space>i", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
      end, bufopts)
    end,

    capabilities = require("cmp_nvim_lsp").default_capabilities()
  })
end

require("lsp_signature").setup({
  hint_enable = false,
  hi_parameter = "LspSignatureActiveParameter",
  handler_opts = { border = "rounded" },
})

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  preselect = cmp.PreselectMode.None,
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-k>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources(
    {
      { name = "nvim_lsp" },
    },
    {
      { name = "buffer" },
    })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'buffer' },
  })
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
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
