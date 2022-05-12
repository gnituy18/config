-- Install vim-plug before running this script

plugins = {
	"'junegunn/fzf', { 'do': { -> fzf#install() } }",
	"'junegunn/fzf.vim'",
	"'tpope/vim-fugitive'",
	"'airblade/vim-gitgutter'",
	"'easymotion/vim-easymotion'",
	"'williamboman/nvim-lsp-installer'",
	"'neovim/nvim-lspconfig'",
	"'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}",
	"'github/copilot.vim'",
	"'ojroques/nvim-lspfuzzy', {'branch': 'main'}",
	"'evanleck/vim-svelte', {'branch': 'main'}",
	"'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }",
	"'kyazdani42/nvim-web-devicons'",
	"'kyazdani42/nvim-tree.lua'",
}

vim.call("plug#begin")
for i, p in pairs(plugins) do
	vim.cmd(string.format("Plug %s", p))
end
vim.call("plug#end")
