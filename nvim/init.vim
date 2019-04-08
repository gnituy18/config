call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
call plug#end()

set mouse=a
set tabstop=4
set shiftwidth=4

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

" ALE
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'javascript': ['prettier'],
\	'javascript.jsx': ['prettier'],
\	'typescript': ['prettier'],
\	'typescript.tsx': ['prettier'],
\}
let g:ale_linters = {
\	'javascript': ['tsserver'],
\	'javascript.jsx': ['tsserver'],
\	'typescript': ['tsserver'],
\	'typescript.tsx': ['tsserver'],
\	'vim': ['vint'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
