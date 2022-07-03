highlight clear
let colors_name = 'cs'

" data: red
" identifier: green
" language: blue
"

" editor status symbol off: 7 
" editor status symbol on:  8
" editor status off: 8
" editor status on: 15 
"
" editor status msg info: 4 
" editor status msg warning: 3
" editor status msg error: 1

" ColorColumn	used for the columns set with 'colorcolumn'
" Conceal		placeholder characters substituted for concealed text (see 'conceallevel')
" Cursor		character under the cursor
" lCursor		the character under the cursor when |language-mapping| is used (see 'guicursor')
" CursorIM		like Cursor, but used when in IME mode |CursorIM|
" CursorColumn	Screen-column at the cursor, when 'cursorcolumn' is set.
hi CursorLine ctermbg=7 ctermfg=none cterm=none
hi Directory ctermbg=none ctermfg=4 cterm=none
hi DiffAdd ctermbg=none ctermfg=2 cterm=none
hi DiffChange ctermbg=none ctermfg=3 cterm=none
hi DiffDelete ctermbg=none ctermfg=1 cterm=none 
" DiffText		diff mode: Changed text within a changed line |diff.txt|
hi EndOfBuffer ctermbg=none ctermfg=7 cterm=none
" TermCursor	cursor in a focused terminal
" TermCursorNC	cursor in an unfocused terminal
hi ErrorMsg	ctermbg=none ctermfg=1 cterm=none
hi WinSeparator	ctermbg=none ctermfg=7 cterm=none
" Folded		line used for closed folds
" FoldColumn	'foldcolumn'
hi SignColumn ctermbg=none ctermfg=none cterm=none
hi! link IncSearch Search
" Substitute	|:substitute| replacement text highlighting
hi LineNr ctermbg=none ctermfg=8 cterm=none
" LineNrAbove	Line number for when the 'relativenumber' option is set, above the cursor line.
" LineNrBelow	Line number for when the 'relativenumber' option is set, below the cursor line.
hi CursorLineNr ctermbg=7 ctermfg=15 cterm=none
hi CursorLineSign ctermbg=none ctermfg=none cterm=none
" CursorLineFold	Like FoldColumn when 'cursorline' is set for the cursor line.
hi MatchParen ctermbg=none ctermfg=none cterm=reverse
hi ModeMsg ctermbg=none ctermfg=8 cterm=none
" MsgArea		Area for messages and cmdline
" MsgSeparator	Separator for scrolled messages, `msgsep` flag of 'display'
hi MoreMsg ctermbg=none ctermfg=8 cterm=none
hi NonText ctermbg=none ctermfg=7 cterm=none
" Normal		normal text
" NormalFloat	Normal text in floating windows.
" NormalNC		normal text in non-current windows
hi Pmenu ctermbg=0 ctermfg=8 cterm=none
hi PmenuSel ctermbg=7 ctermfg=15 cterm=none
hi PmenuSbar ctermbg=0 ctermfg=none cterm=none
hi PmenuThumb ctermbg=7 ctermfg=none cterm=none
hi Question ctermbg=none ctermfg=15 cterm=none
" QuickFixLine	Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
hi Search ctermbg=3 ctermfg=0 cterm=none
hi SpecialKey ctermbg=none ctermfg=5 cterm=none
" SpellBad		Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
" SpellCap		Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
" SpellLocal	Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
" SpellRare		Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
hi StatusLine ctermbg=none ctermfg=15 cterm=none
hi StatusLineNC ctermbg=none ctermfg=8 cterm=none

hi TabLine ctermbg=none ctermfg=8 cterm=none
hi TabLineFill ctermbg=none ctermfg=none cterm=none
hi TabLineSel ctermbg=none ctermfg=15 cterm=none
hi Title ctermbg=none ctermfg=4 cterm=none
hi Visual ctermbg=4 ctermfg=0 cterm=none
" VisualNOS		Visual mode selection when vim is "Not Owning the Selection".
hi WarningMsg ctermbg=none ctermfg=3 cterm=underline
" Whitespace	"nbsp", "space", "tab", "multispace", "lead" and "trail" in 'listchars'
" WildMenu	current match in 'wildmenu' completion

hi Comment ctermbg=none ctermfg=8 cterm=none

hi Constant	ctermbg=none ctermfg=3 cterm=none
" 	 String		a string constant: "this is a string"
" 	 Character	a character constant: 'c', '\n'
" 	 Number		a number constant: 234, 0xff
" 	 Boolean	a boolean constant: TRUE, false
" 	 Float		a floating point constant: 2.3e10
" 
hi Identifier ctermbg=none ctermfg=10 cterm=none
" 	 Function	function name (also: methods for classes)
" 
hi Statement ctermbg=none ctermfg=4 cterm=none
" 	 Conditional	if, then, else, endif, switch, etc.
" 	 Repeat		for, do, while, etc.
" 	 Label		case, default, etc.
" 	 Operator	"sizeof", "+", "*", etc.
" 	 Keyword	any other keyword
" 	 Exception	try, catch, throw
" 
hi PreProc ctermbg=none ctermfg=4 cterm=none
" 	 Include	preprocessor #include
" 	 Define		preprocessor #define
" 	 Macro		same as Define
" 	 PreCondit	preprocessor #if, #else, #endif, etc.
" 
hi Type	ctermbg=none ctermfg=1 cterm=none
" 	 StorageClass	static, register, volatile, etc.
" 	 Structure	struct, union, enum, etc.
" 	 Typedef	A typedef
" 
hi Special ctermbg=none ctermfg=5 cterm=none
" 	 SpecialChar	special character in a constant
" 	 Tag		you can use CTRL-] on this
" 	 Delimiter	character that needs attention
" 	 SpecialComment	special things inside a comment
" 	 Debug		debugging statements
" 
hi Underlined ctermbg=none ctermfg=6 cterm=underline
" 
" 	*Ignore		left blank, hidden  |hl-Ignore|
" 
hi Error ctermbg=none ctermfg=1 cterm=underline
hi Todo ctermbg=none ctermfg=3 cterm=underline
