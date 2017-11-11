call plug#begin('~/.vim/plugins')
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
call plug#end()

" General
set nocompatible
set history=50
set autoread
filetype plugin on
filetype indent on

" Interface
set wildmenu
set ruler
set number
set incsearch
set showcmd
set fillchars+=vert:\┃
set t_Co=256
syntax on
colorscheme my-highlight

" Editing
let mapleader=','
set cursorline
set encoding=utf8
set foldmethod=indent
set nohlsearch
set nofoldenable
set autoindent
set shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType pug setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType scss setlocal expandtab shiftwidth=2 softtabstop=2

" Keyboard
set backspace=eol,start,indent
set whichwrap+=<,>,[,]
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Mouse
set mouse=a

" NERDtree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_Store$', '[._]sw[a-p]$', '^.git$']
nnoremap <C-n> :NERDTreeToggle<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1

" Deoplete-ternjs
let g:deoplete#sources#ternjs#include_keywords = 1
