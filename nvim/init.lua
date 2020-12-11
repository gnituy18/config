plugins = {
  '/usr/local/opt/fzf',
  'junegunn/fzf.vim',
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',
  'easymotion/vim-easymotion',
  'neovim/nvim-lspconfig'
}

vim.cmd('call plug#begin()')
for i, p in pairs(plugins) do 
	vim.cmd(string.format('Plug \'%s\'', p)) 
end
vim.cmd('call plug#end()')

require'lspconfig'.gopls.setup{}

vim.g.mapleader = ' '
vim.o.updatetime = 500
vim.o.mouse = 'a'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.o.matchpairs = vim.o.matchpairs .. ',<:>'
vim.o.ignorecase = true

vim.cmd('autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc')

vim.cmd('colorscheme mine') 
vim.cmd('nnoremap <C-j> <C-w>j')
vim.cmd('nnoremap <C-k> <C-w>k')
vim.cmd('nnoremap <C-h> <C-w>h')
vim.cmd('nnoremap <C-l> <C-w>l')
vim.cmd('nmap <silent> <Leader>j :BLines<CR>')
vim.cmd('nmap <silent> <Leader>k :Rg<CR>')
vim.cmd('nmap <silent> <Leader>l :Files<CR>')
vim.cmd('nmap <silent> <Leader>wq :wq<CR>')
vim.cmd('nmap <silent> <Leader>q :q!<CR>')
vim.cmd('nmap <silent> <Leader>Q :qa!<CR>')
vim.cmd('nmap <silent> <Leader>/ :noh<CR>')
vim.cmd('nmap <silent> <Leader>e :Ex<CR>')
vim.cmd('nmap f <Plug>(easymotion-s)')
vim.cmd('hi link EasyMotionTarget Search')
vim.cmd('hi link EasyMotionShade Comment')
vim.cmd('hi link EasyMotionTarget2First Search')
vim.cmd('hi link EasyMotionTarget2Second Search')
vim.cmd('hi link EasyMotionMoveHL Search')
vim.cmd('hi link EasyMotionIncSearch Search')
vim.cmd('hi SignColumn ctermbg=0')

vim.cmd('noremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>')
vim.cmd('noremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>')
vim.cmd('noremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>')
vim.cmd('noremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.cmd('noremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.cmd('noremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>')
vim.cmd('noremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>')
vim.cmd('noremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
vim.cmd('noremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>')
vim.cmd('noremap <silent> <Leader>f <cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>')

-- nmap <silent> <Leader>v :tabe $MYVIMRC<CR>
--
-- " nnoremap <Tab>
-- " nnoremap <S-Tab>
-- " nnoremap <Space>
-- " nnoremap <C-m> 
-- " nnoremap <Leader>sd :Sex<CR>
-- " nnoremap <Leader>vd :Vex<CR>
-- " nnoremap <Leader>td :Tex<CR>
