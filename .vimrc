" Switch bash to default shell
set shell=/bin/bash

" Pathogen
execute pathogen#infect()

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
syntax enable 

" Editing
set foldmethod=indent
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

" NerdTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_Store$', '[._]sw[a-p]$', '^node_modules$', '^.git$']
map <C-n> :NERDTreeToggle<CR>

" Hybrid
set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = '--fix'

let g:syntastic_scss_checkers = ['']
