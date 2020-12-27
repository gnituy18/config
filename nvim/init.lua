require "plugins"
require "lsp"

-- setting
vim.g.mapleader = " "
vim.g.loaded_matchparen = 1
vim.o.updatetime = 500
vim.o.mouse = "a"
vim.o.ignorecase = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.matchpairs = vim.o.matchpairs .. ",<:>"
vim.o.omnifunc = "v:lua.vim.lsp.omnifunc"
vim.o.completeopt = "menu"
vim.wo.cursorline = true
vim.wo.number = true

vim.cmd("colorscheme mine")

-- replace f with easymotion-overwin-f
vim.api.nvim_set_keymap("n", "f", "<Plug>(easymotion-overwin-f)", {})

-- editor
vim.api.nvim_set_keymap("n", "<Leader>q", "<Cmd>q!<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>w", "<Cmd>w<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>e", "<Cmd>Tex<CR>", {})

-- helper
vim.api.nvim_set_keymap("n", "<Leader>a", "<Cmd>lua vim.lsp.buf.code_action()<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>s", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>d", "<Cmd>lua vim.lsp.buf.hover()<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>f", "<Cmd>lua vim.lsp.buf.formatting(nil)<CR>", {})
vim.api.nvim_set_keymap("i", "<C-j>", "<C-x><C-o>", {})

-- jumping
vim.api.nvim_set_keymap("n", "<Leader>j", "<Cmd>lua vim.lsp.buf.definition()<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>k", "<Cmd>lua vim.lsp.buf.references()<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>l", "<Cmd>lua vim.lsp.buf.implementation()<CR>", {})

-- search
vim.api.nvim_set_keymap("n", "<Leader>,", "<Cmd>Rg<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>.", "<Cmd>Files<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>/", "<Cmd>noh<CR>", {})

-- tabs
for i=1,9 do
	vim.api.nvim_set_keymap("n", "<Leader>"..i, i.."gt", {})
end
