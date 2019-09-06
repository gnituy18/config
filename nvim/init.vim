call plug#begin()
Plug 'tpope/vim-fugitive'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
call plug#end()

let mapleader=' '

set updatetime=100
set mouse=a
set tabstop=4
set shiftwidth=4
set number
set relativenumber
set cursorline
set matchpairs+=<:>
set ignorecase

colorscheme mine

augroup acmd
	autocmd!
	autocmd FileType typescript setlocal expandtab shiftwidth=2 softtabstop=2
	autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
	autocmd BufWritePost init.vim source $MYVIMRC
augroup END

nmap <silent> <Leader>d <Plug>(coc-definition)
nmap <silent> <Leader>r <Plug>(coc-references)
nmap <silent> <Leader>v :tabe $MYVIMRC<CR>
nmap <silent> <Leader>f <Plug>(coc-format)
vmap <silent> <Leader>f <Plug>(coc-format-selected)
nmap <silent> <Leader>j :BLines<CR>
nmap <silent> <Leader>k :Rg<CR>
nmap <silent> <Leader>l :Files<CR>
nmap <silent> <Leader>wq :wq<CR>
nmap <silent> <Leader>q :q!<CR>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" nnoremap <Tab>
" nnoremap <S-Tab>
" nnoremap <Space>
" nnoremap <C-n> :LspNextReference<CR>
" nnoremap <C-p> :LspPreviousReference<CR>
" nnoremap <C-m> 
" nnoremap <Leader>sd :Sex<CR>
" nnoremap <Leader>vd :Vex<CR>
" nnoremap <Leader>td :Tex<CR>
" nnoremap <Leader>c :noh<CR>
" nnoremap <Leader>i :LspHover<CR>
" nnoremap <Leader>t :Vista fzf<CR>

let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:40%']
let g:vista_icon_indent = ["> ", "	"]

source ~/local.vim
