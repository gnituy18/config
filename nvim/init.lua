require "plugins"
require "setting"
require "treesitter"
require "lsp"
require "fzf"
require'nvim-tree'.setup {}

-- setting
vim.g.mapleader = " "
vim.g.loaded_matchparen = 1
vim.o.updatetime = 300
vim.o.mouse = "a"
vim.o.clipboard = "unnamed"
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
vim.keymap.set("n", "f", "<Plug>(easymotion-overwin-f)")

-- editor
vim.keymap.set("n", "<Leader>q", "<Cmd>q!<CR>")
vim.keymap.set("n", "<Leader>w", "<Cmd>w<CR>")
vim.keymap.set("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>")

-- helper
vim.keymap.set("n", "<Leader>a", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<Leader>s", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>")
vim.keymap.set("n", "<Leader>d", "<Cmd>lua vim.diagnostic.open_float(nil, {focusable=false})<CR>")
vim.keymap.set("n", "<Leader>f", "<Cmd>lua vim.lsp.buf.formatting(nil)<CR>")
vim.keymap.set("n", "<Leader>h", "<Cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("i", "<C-j>", "<C-x><C-o>")

-- jumping
vim.keymap.set("n", "<Leader>j", "<Cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<Leader>k", "<Cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "<Leader>l", "<Cmd>lua vim.lsp.buf.implementation()<CR>")

-- search
vim.keymap.set("n", "<Leader>,", "<Cmd>Rg<CR>")
vim.keymap.set("n", "<Leader>.", "<Cmd>Files<CR>")
vim.keymap.set("n", "<Leader>/", "<Cmd>noh<CR>")

-- tabs
for i = 1, 9 do
	vim.keymap.set("n", "<Leader>" .. i, i .. "gt")
end
