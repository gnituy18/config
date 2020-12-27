-- Install vim-plug before running this script

plugins = {
	"'/usr/local/opt/fzf'",
	"'junegunn/fzf.vim'",
	"'tpope/vim-fugitive'",
	"'airblade/vim-gitgutter'",
	"'easymotion/vim-easymotion'",
	"'neovim/nvim-lspconfig'",
	"'ojroques/nvim-lspfuzzy', {'branch': 'main'}"
}

vim.call("plug#begin")
for i, p in pairs(plugins) do
	vim.cmd(string.format("Plug %s", p))
end
vim.call("plug#end")
