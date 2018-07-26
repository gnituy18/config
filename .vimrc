call plug#begin('~/.vim/plugins')
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'c0r73x/neotags.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'xolox/vim-misc'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
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
colorscheme my-highlights

" Editing
let mapleader=','
set list
set lcs=trail:\ 
set cursorline
set encoding=utf8
set foldmethod=indent
set nofoldenable
set autoindent
set shiftwidth=4 tabstop=4
set iskeyword=@
set ignorecase
set nolist
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType pug setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType scss setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType go setlocal shiftwidth=2 tabstop=2

" Keyboard
set backspace=eol,start,indent
set whichwrap+=<,>,[,]
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Mouse
set mouse=a

" Terminal
nnoremap <C-t>t :tabedit term://bash<CR>ilogin<CR>charlieHsu<CR>
nnoremap <C-t>v :vsplit term://bash<CR>ilogin<CR>charlieHsu<CR>
nnoremap <C-t>s :split term://bash<CR>ilogin<CR>charlieHsu<CR>
tnoremap <Esc> <C-\><C-n>

" Vimrc
:nnoremap <leader>ev :tabe $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" NERDtree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_Store$', '[._]sw[a-p]$', '^.git$']
nnoremap <C-n> :NERDTreeToggle<CR>

" fzf
set rtp+=/usr/local/opt/fzf

" DevIcon
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

let g:neotags#javascript#order = 'cCfmpo'

" ctrlp
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_map = '<c-p>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Deoplete
let g:deoplete#enable_at_startup = 1

" Deoplete-ternjs
let g:deoplete#sources#ternjs#include_keywords = 1

" ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
