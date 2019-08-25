call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'lighttiger2505/deoplete-vim-lsp'
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
nnoremap <Leader>gd :LspDefinition<CR>
nnoremap <Leader>i :LspHover<CR>
nnoremap <Leader>f :LspDocumentFormat<CR>
nnoremap <Leader>t :Vista finder fzf<CR>
nnoremap <C-n> :LspNextReference<CR>
nnoremap <C-p> :LspPreviousReference<CR>

let g:deoplete#enable_at_startup = 1
let g:vista_default_executive = 'vim_lsp'
let g:vista_fzf_preview = ['right:30%']
let g:vista_icon_indent = ["> ", "	"]
highlight	lspReference	ctermbg=8		ctermfg=none	cterm=none

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'typescript support using typescript-language-server',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio --tsserver-path=tsserver']},
    \ 'whitelist': ['typescript', 'typescript.tsx'],
    \ })
endif

source ~/local.vim
