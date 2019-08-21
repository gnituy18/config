call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
" Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'liuchengxu/vista.vim'
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
set hidden

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
nnoremap <Leader>d :E<CR>
nnoremap <Leader>sd :Sex<CR>
nnoremap <Leader>vd :Vex<CR>
nnoremap <Leader>vd :Vex<CR>
inoremap <C-j> <C-x><C-o>
nnoremap <Leader>gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <Leader>i :call LanguageClient#textDocument_hover()<CR>
nnoremap <Leader>f :call LanguageClient#textDocument_formatting()<CR>
nnoremap <Leader>s :Vista lcn<CR>

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ }

" ALE
" let g:ale_fixers = {
" \	'*': ['remove_trailing_lines', 'trim_whitespace'],
" \	'go': ['gofmt'],
" \	'javascript': ['prettier'],
" \	'javascript.jsx': ['prettier'],
" \	'typescript': ['prettier'],
" \	'typescript.tsx': ['prettier'],
" \	'html': ['prettier'],
" \	'markdown': ['prettier'],
" \}
" let g:ale_linters = {
" \	'go': ['golangserver'],
" \	'javascript': ['tsserver'],
" \	'javascript.jsx': ['tsserver'],
" \	'typescript': ['tsserver'],
" \	'typescript.tsx': ['tsserver'],
" \	'html': ['tsserver'],
" \	'vim': ['vint'],
" \	'sh': ['language_server'],
" \}
" let g:ale_fix_on_save = 0
" let g:ale_completion_enabled = 1
" let g:ale_go_langserver_options = '-diagnostics -func-snippet-enabled -lint-tool golint'
" nnoremap <Leader>gd :ALEGoToDefinitionInTab<CR>
" nnoremap <Leader>af :ALEFix<CR>

source ~/local.vim
