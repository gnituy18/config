set background=dark
highlight clear

function! s:hl(group, bg, fg, opt)
  execute 'hi ' . a:group . ' ctermbg=' . a:bg . ' ctermfg=' . a:fg . ' cterm=' . a:opt
endfunction

let s:black  = 236
let s:white  = 231
let s:grayd  = 237
let s:grayl  = 245

let s:red    = 211
let s:orange = 215
let s:yellow = 221
let s:green  = 192
let s:blue   = 153
let s:cyan   = 159
let s:purple = 183
let s:pink   = 225

let s:redd   = 198
let s:blued  = 75
let s:yellowd= 227

cal s:hl('Normal', s:black, s:white, 'none')
cal s:hl('statusLine', s:grayd, s:white, 'none') 
cal s:hl('statusLineNC', s:grayd, s:grayl, 'none') 
cal s:hl('LineNr', 'none', s:grayl, 'none') 
cal s:hl('CursorLineNr', s:grayd, s:white, 'bold')
cal s:hl('CursorLine', s:grayd, 'none', 'none')
cal s:hl('CursorColumn', 'none', 'none', 'none')
cal s:hl('VertSplit', 'none', s:grayd, 'none') 
cal s:hl('NonText', 'none', s:grayl, 'none') 
cal s:hl('EndOfBuffer', 'none', s:grayl, 'none') 
cal s:hl('Directory', 'none', s:blued, 'none') 

" what?
cal s:hl('Ignore', 'none', s:pink, 'none') 
cal s:hl('Conceal', 'none', s:pink, 'none') 

cal s:hl('Comment', 'none', s:grayl, 'bold')
cal s:hl('Constant', 'none', s:yellow, 'none')
cal s:hl('Identifier', 'none', s:orange, 'none')
cal s:hl('Statement', 'none', s:blue, 'none')
cal s:hl('Type', 'none', s:red, 'none')
cal s:hl('PreProc', 'none', s:green, 'none')
cal s:hl('Special', 'none', s:purple, 'none')
cal s:hl('SpecialKey', 'none', s:pink, 'none')
cal s:hl('Underlined', 'none', s:cyan, 'underline')
cal s:hl('Error', 'none', s:redd, 'underline')
cal s:hl('Todo', 'none', s:yellowd, 'underline')

cal s:hl('Search', s:yellowd, 'bg', 'none') 
cal s:hl('IncSearch', s:yellowd, 'bg', 'none') 
cal s:hl('ErrorMsg', 'none', s:redd, 'underline') 

" fjdoisjfois
"
