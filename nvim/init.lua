vim.o.number = true
vim.o.cursorline = true

vim.cmd.colorscheme("hsuyuting")

for i = 1, 9 do
  vim.keymap.set("n", "<Space>" .. i, i .. "gt")
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require "lazy".setup({
  { "nvim-treesitter/nvim-treesitter",     build = ":TSUpdate" },
  "lewis6991/gitsigns.nvim",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",       opts = {} },
  "karb94/neoscroll.nvim",
  "ibhagwan/fzf-lua",
  "tpope/vim-repeat",
  "ggandor/leap.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "zbirenbaum/copilot.lua",
  "zbirenbaum/copilot-cmp",
})

require "nvim-treesitter.configs".setup({
  ensure_installed = "all",
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})

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

require "ibl".setup {}

require "neoscroll".setup {}

require "fzf-lua".setup {}
vim.keymap.set("n", "<Space>j", require "fzf-lua".buffers)
vim.keymap.set("n", "<Space>k", require "fzf-lua".files)
vim.keymap.set("n", "<Space>l", require "fzf-lua".live_grep)
vim.keymap.set("n", "<Space>o", require "fzf-lua".jumps)

require "leap".add_default_mappings()

local servers = { "rust_analyzer", "gopls", "lua_ls", "tsserver", "html", "tailwindcss", "cssls", "yamlls", "jsonls",
  "intelephense", "volar" }

require "mason".setup {}
require "mason-lspconfig".setup {
  ensure_installed = servers,
  automatic_installation = true,
}

vim.keymap.set("n", "<Space>d", function() vim.diagnostic.open_float(nil, { focusable = false }) end,
  { noremap = true, silent = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })

for _, server in ipairs(servers) do
  require "lspconfig"[server].setup {
    on_attach = function(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", function() require "fzf-lua".lsp_definitions({ jump_to_single_result = true }) end,
        bufopts)
      vim.keymap.set("n", "gD", function() require "fzf-lua".lsp_declarations({ jump_to_single_result = true }) end,
        bufopts)
      vim.keymap.set("n", "gi", function() require "fzf-lua".lsp_implementations({ jump_to_single_result = true }) end,
        bufopts)
      vim.keymap.set("n", "gr", function() require "fzf-lua".lsp_references({ jump_to_single_result = true }) end,
        bufopts)
      vim.keymap.set("n", "gt", function() require "fzf-lua".lsp_typedefs({ jump_to_single_result = true }) end,
        bufopts)

      vim.keymap.set("n", "<Space>h", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "<Space>s", vim.lsp.buf.signature_help, bufopts)

      vim.keymap.set("n", "<Space>r", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<Space>a", require "fzf-lua".lsp_code_actions, bufopts)
      vim.keymap.set("n", "<Space>f", function() vim.lsp.buf.format { async = true } end, bufopts)
    end,

    capabilities = require "cmp_nvim_lsp".default_capabilities()
  }
end

require "cmp".setup {
  mapping = require "cmp".mapping.preset.insert({
    ["<C-b>"] = require "cmp".mapping.scroll_docs(-4),
    ["<C-f>"] = require "cmp".mapping.scroll_docs(4),
    ["<C-j>"] = require "cmp".mapping.complete(),
    ["<C-e>"] = require "cmp".mapping.abort(),
    ["<CR>"] = require "cmp".mapping.confirm(),
  }),
  sources = require "cmp".config.sources {
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lsp_document_symbol" },
    { name = "path" },
  }, {
  { name = "buffer" },
},
}

require "cmp".setup.cmdline({ '/', '?' }, {
  mapping = require "cmp".mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

require "cmp".setup.cmdline(':', {
  mapping = require "cmp".mapping.preset.cmdline(),
  sources = require "cmp".config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

require "copilot_cmp".setup({
  filetypes = {
    yaml = true,
    markdown = true,
  }
})
