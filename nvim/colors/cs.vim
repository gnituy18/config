highlight clear
let colors_name = 'cs'
" ctermbg=0 ctermfg=7 cterm=none guibg=0 guifg=7 gui=none
"
" Conceal ctermbg=0 ctermfg=7 cterm=none guibg=0 guifg=7 gui=none
" Cursor ctermbg=15 ctermfg=0 cterm=none guibg=12 guifg=0 gui=none
" lCursor		the character under the cursor when |language-mapping|
" CursorIM	like Cursor, but used when in IME mode |CursorIM|
" CursorColumn	Screen-column at the cursor, when 'cursorcolumn' is set.
"
hi CursorLine ctermbg=7 ctermfg=none cterm=none
" Directory	directory names (and other special names in listings)
" DiffAdd		diff mode: Added line |diff.txt|
" DiffChange	diff mode: Changed line |diff.txt|
" DiffDelete	diff mode: Deleted line |diff.txt|
" DiffText	diff mode: Changed text within a changed line |diff.txt|
" EndOfBuffer	filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
" TermCursor	cursor in a focused terminal
" TermCursorNC	cursor in an unfocused terminal
" ErrorMsg	error messages on the command line
" WinSeparator	separators between window splits
" Folded		line used for closed folds
" FoldColumn	'foldcolumn'
" SignColumn	column where |signs| are displayed
" IncSearch	'incsearch' highlighting; also used for the text replaced with ":s///c"
" Substitute	|:substitute| replacement text highlighting
" LineNr		Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
" LineNrAbove	Line number for when the 'relativenumber' option is set, above the cursor line.
" LineNrBelow	Line number for when the 'relativenumber' option is set, below the cursor line.
" CursorLineNr	Like LineNr when 'cursorline' is set and 'cursorlineopt' contains "number" or is "both", for the cursor line.
" CursorLineSign	Like SignColumn when 'cursorline' is set for the cursor line.
" CursorLineFold	Like FoldColumn when 'cursorline' is set for the cursor line.
" MatchParen	The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
" ModeMsg		'showmode' message (e.g., "-- INSERT --")
" MsgArea		Area for messages and cmdline
" MsgSeparator	Separator for scrolled messages, `msgsep` flag of 'display'
" MoreMsg		|more-prompt|
" NonText		'@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
hi Normal ctermbg=0 ctermfg=15 cterm=none guibg=0 guifg=15 gui=none
" NormalFloat	Normal text in floating windows.
" NormalNC	normal text in non-current windows
" Pmenu		Popup menu: normal item.
" PmenuSel	Popup menu: selected item.
" PmenuSbar	Popup menu: scrollbar.
" PmenuThumb	Popup menu: Thumb of the scrollbar.
" Question	|hit-enter| prompt and yes/no questions
" QuickFixLine	Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
" Search		Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
" SpecialKey	Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
" SpellBad	Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
" SpellCap	Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
" SpellLocal	Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
" SpellRare	Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
" StatusLine	status line of current window
" StatusLineNC	status lines of not-current windows
" 		Note: if this is equal to "StatusLine" Vim will use "^^^" in
" 		the status line of the current window.
" TabLine		tab pages line, not active tab page label
" TabLineFill	tab pages line, where there are no labels
" TabLineSel	tab pages line, active tab page label
" Title		titles for output from ":set all", ":autocmd" etc.
" Visual		Visual mode selection
" VisualNOS	Visual mode selection when vim is "Not Owning the Selection".
" WarningMsg	warning messages
" Whitespace	"nbsp", "space", "tab", "multispace", "lead" and "trail" in 'listchars'
" WildMenu	current match in 'wildmenu' completion The 'statusline' syntax allows the use of 9 different highlights in the statusline and ruler (via 'rulerformat').  The names are User1 to User9.
" 
" For the GUI you can use the following groups to set the colors for the menu,
" scrollbars and tooltips.  They don't have defaults.  This doesn't work for the
" Win32 GUI.  Only three highlight arguments have any effect here: font, guibg,
" and guifg.
" 
" Menu		Current font, background and foreground colors of the menus.
" 		Also used for the toolbar.
" 		Applicable highlight arguments: font, guibg, guifg.
" 
" Scrollbar	Current background and foreground of the main window's scrollbars.
" 		Applicable highlight arguments: guibg, guifg.
" Tooltip		Current font, background and foreground of the tooltips.
" 
" Comment	any comment
" 
" 	*Constant	any constant
" 	 String		a string constant: "this is a string"
" 	 Character	a character constant: 'c', '\n'
" 	 Number		a number constant: 234, 0xff
" 	 Boolean	a boolean constant: TRUE, false
" 	 Float		a floating point constant: 2.3e10
" 
" 	*Identifier	any variable name
" 	 Function	function name (also: methods for classes)
" 
" 	*Statement	any statement
" 	 Conditional	if, then, else, endif, switch, etc.
" 	 Repeat		for, do, while, etc.
" 	 Label		case, default, etc.
" 	 Operator	"sizeof", "+", "*", etc.
" 	 Keyword	any other keyword
" 	 Exception	try, catch, throw
" 
" 	*PreProc	generic Preprocessor
" 	 Include	preprocessor #include
" 	 Define		preprocessor #define
" 	 Macro		same as Define
" 	 PreCondit	preprocessor #if, #else, #endif, etc.
" 
" 	*Type		int, long, char, etc.
" 	 StorageClass	static, register, volatile, etc.
" 	 Structure	struct, union, enum, etc.
" 	 Typedef	A typedef
" 
" 	*Special	any special symbol
" 	 SpecialChar	special character in a constant
" 	 Tag		you can use CTRL-] on this
" 	 Delimiter	character that needs attention
" 	 SpecialComment	special things inside a comment
" 	 Debug		debugging statements
" 
" 	*Underlined	text that stands out, HTML links
" 
" 	*Ignore		left blank, hidden  |hl-Ignore|
" 
" 	*Error		any erroneous construct
" 
" 	*Todo		anything that needs extra attention; mostly the
" 			keywords TODO FIXME and XXX
