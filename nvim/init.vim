call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
call plug#end()

let mapleader=','

set updatetime=100
set mouse=a
set tabstop=4
set shiftwidth=4
set number
set relativenumber
set cursorline
set matchpairs+=<:>

colorscheme mine
augroup acmd
	autocmd!
	autocmd FileType typescript setlocal expandtab shiftwidth=2 softtabstop=2
	autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
augroup END

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <Leader>f :E<CR>

" ALE
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'go': ['gofmt'],
\	'javascript': ['prettier'],
\	'javascript.jsx': ['prettier'],
\	'typescript': ['prettier'],
\	'typescript.tsx': ['prettier'],
\	'html': ['prettier'],
\	'markdown': ['prettier'],
\}
let g:ale_linters = {
\	'go': ['golangserver'],
\	'javascript': ['tsserver'],
\	'javascript.jsx': ['tsserver'],
\	'typescript': ['tsserver'],
\	'typescript.tsx': ['tsserver'],
\	'html': ['tsserver'],
\	'vim': ['vint'],
\	'sh': ['language_server'],
\}
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 1
nnoremap <Leader>gd :ALEGoToDefinitionInTab<CR>
nnoremap <Leader>af :ALEFix<CR>
