" This file is deprecated
set background=dark

highlight clear

function! s:hl(group, bg, fg, opt)
  let s:chain = ''
  if a:bg != ''
    let s:chain .= ' ctermbg=' . a:bg
  endif

  if a:fg != ''
    let s:chain .= ' ctermfg=' . a:fg
  endif

  if a:opt != ''
    let s:chain .= ' cterm=' . a:opt
  endif

  execute 'hi ' . a:group . s:chain
endfunction

let s:black      = 236
let s:white      = 231
let s:darkGray   = 237
let s:lightGray  = 245

let s:red        = 211
let s:orange     = 215
let s:yellow     = 221
let s:green      = 192
let s:blue       = 153
let s:cyan       = 159
let s:purple     = 183
let s:pink       = 225

let s:darkRed    = 198
let s:darkBlue   = 75
let s:darkYellow = 227

" Unused syntax groups
" ColorColumn
" Conceal
" CursorColumn
" TermCursor
" TermCursorNC

" what?
cal s:hl('Ignore', s:pink, s:pink, 'none')
cal s:hl('Sign', s:pink, s:pink, 'none')
cal s:hl('NonText', s:pink, s:pink, 'none')

" Editor
cal s:hl('Normal', s:black, s:white, 'none')
cal s:hl('Title', 'bg', s:darkBlue, 'bold')
cal s:hl('statusLine', s:darkGray, s:white, 'none')
cal s:hl('statusLineNC', s:darkGray, s:lightGray, 'none')
cal s:hl('LineNr', 'none', s:lightGray, 'none')
cal s:hl('CursorLineNr', s:darkGray, s:white, 'bold')
cal s:hl('CursorLine', s:darkGray, 'none', 'none')
cal s:hl('VertSplit', 'none', s:darkGray, 'none')
cal s:hl('EndOfBuffer', 'none', s:lightGray, 'none')
cal s:hl('TabLine', s:darkGray, s:lightGray, 'none')
cal s:hl('TabLineFill', s:darkGray, 'none', 'none')
cal s:hl('TabLineSel', 'bg', s:white, 'none')
cal s:hl('Visual', s:blue, 'bg', 'none')
cal s:hl('Whitespace', s:red, 'fg', 'none')
cal s:hl('directory', 'none', s:darkBlue, 'none')
cal s:hl('WildMenu', s:yellow, 'bg', 'none')
cal s:hl('cursor', 'none', 'none', 'reverse')
cal s:hl('cursorIM', 'none', 'none', 'reverse')
cal s:hl('pmenu', s:darkGray, s:lightGray, 'none')
cal s:hl('pmenusel', s:lightGray, s:white, 'none')
cal s:hl('PmenuSbar', s:darkGray, 'none', 'none')
cal s:hl('PmenuThumb', s:lightGray, 'none', 'none')
cal s:hl('IncSearch', s:darkYellow, 'bg', 'none')
cal s:hl('Search', s:darkYellow, 'bg', 'none')
cal s:hl('Substitute', s:darkGray, s:lightGray, 'none')
cal s:hl('Folded', s:darkGray, s:lightGray, 'none')
cal s:hl('FoldColumn', s:darkGray, s:lightGray, 'none')
cal s:hl('DiffAdd', 'none', s:green, 'none')
cal s:hl('DiffChange', 'none', s:yellow, 'none')
cal s:hl('DiffDelete', 'none', s:red, 'none')
cal s:hl('DiffText', 'none', s:red, 'none')
cal s:hl('ErrorMsg', 'none', s:darkRed, 'underline')
cal s:hl('ModeMsg', 'none', s:white, 'none')
cal s:hl('MoreMsg', 'none', s:white, 'none')
cal s:hl('Qusetion', 'none', s:green, 'none')
cal s:hl('QuickFixLine', 'none', s:darkRed, 'none')
cal s:hl('SpellBad', 'none', s:darkRed, 'none')
cal s:hl('SpellCap', 'none', s:darkRed, 'none')
cal s:hl('SpellLocal', 'none', s:darkRed, 'none')
cal s:hl('SpellRare', 'none', s:darkRed, 'none')
cal s:hl('MatchParen', s:darkGray, s:yellow, 'bold')

" Words
cal s:hl('Comment', 'none', s:lightGray, 'none')
cal s:hl('Constant', 'none', s:yellow, 'none')
cal s:hl('Identifier', 'none', s:orange, 'none')
cal s:hl('Statement', 'none', s:blue, 'none')
cal s:hl('Type', 'none', s:red, 'none')
cal s:hl('PreProc', 'none', s:green, 'none')
cal s:hl('Special', 'none', s:purple, 'none')
cal s:hl('SpecialKey', 'none', s:pink, 'none')
cal s:hl('Underlined', 'none', s:cyan, 'underline')
cal s:hl('Error', 'none', s:darkRed, 'underline')
cal s:hl('Todo', 'none', s:darkYellow, 'underline')

" vim-javascript
cal s:hl('jsNoise', 'none', s:lightGray, 'none')
cal s:hl('jsFuncCall', 'none', s:orange, 'none')
cal s:hl('jsObjectProp', 'none', s:orange, 'none')
cal s:hl('jsParseError', 'none', s:darkRed, 'none')
