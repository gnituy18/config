"	0	Black			Background
"	7	White   		Text, Active Text
"	8	DarkGray		Background Current
"	15	LightGray		Comment, Inactive Text
"
"	1	Red     		Type, Error, Gir Delete,
"	3	Orange			Var
"	11	Yellow			Highlight, Search, Git Modified
"	2	Green   		Import, Success Msg, Git Add,
"	4	Blue    		Select
"	6	Cyan			Links, NonText
"	5	Purple			Special Char
"
"	9	Pink
"	10	LightGreen
"	12	LightBlue

"	13	LightPurple
"	14	LightCyan

set background=light
highlight clear

let colors_name = 'mine'

highlight	Normal			ctermbg=0		ctermfg=7		cterm=none
highlight	NormalNC		ctermbg=0		ctermfg=7		cterm=none
highlight	Title			ctermbg=none 	ctermfg=4		cterm=none
highlight	StatusLine		ctermbg=none	ctermfg=7		cterm=none
highlight	StatusLineNC	ctermbg=none	ctermfg=15		cterm=none
highlight	StatusLineTerm	ctermbg=none	ctermfg=7		cterm=none
highlight	StatusLineTermNC	ctermbg=none	ctermfg=15		cterm=none
highlight	LineNr			ctermbg=none	ctermfg=15		cterm=none
highlight	CursorLineNr	ctermbg=none	ctermfg=15		cterm=none
highlight	CursorLine		ctermbg=8		ctermfg=none	cterm=none
highlight	VertSplit		ctermbg=none	ctermfg=8		cterm=none
highlight	EndOfBuffer		ctermbg=none	ctermfg=8		cterm=none
highlight	TabLine			ctermbg=none	ctermfg=15		cterm=none
highlight	TabLineFill		ctermbg=none	ctermfg=none	cterm=none
highlight	TabLineSel		ctermbg=none	ctermfg=7		cterm=none
highlight	Visual			ctermbg=4		ctermfg=0		cterm=none
highlight	VisualNC		ctermbg=4		ctermfg=0		cterm=none
highlight	Whitespace		ctermbg=none	ctermfg=none	cterm=none
highlight	Directory		ctermbg=none	ctermfg=4		cterm=none
highlight	Search			ctermbg=11		ctermfg=0		cterm=none
highlight	IncSearch		ctermbg=11		ctermfg=0		cterm=none
highlight	WildMenu		ctermbg=4		ctermfg=0		cterm=none
highlight	Cursor			ctermbg=7		ctermfg=0		cterm=none
highlight	CursorIM		ctermbg=7		ctermfg=0		cterm=none
highlight	TermCursor		ctermbg=7		ctermfg=0		cterm=none
highlight	TermCursorNC	ctermbg=7		ctermfg=0		cterm=none
highlight	MatchParen		ctermbg=11		ctermfg=0		cterm=none
highlight	ErrorMsg		ctermbg=none	ctermfg=1		cterm=none
highlight	WarningMsg		ctermbg=none	ctermfg=11		cterm=none
highlight	DiffAdd			ctermbg=none	ctermfg=2		cterm=none
highlight	DiffChange		ctermbg=none	ctermfg=11		cterm=none
highlight	DiffDelete		ctermbg=none	ctermfg=1		cterm=none
highlight	DiffText		ctermbg=none	ctermfg=11		cterm=none
highlight	Folded			ctermbg=8		ctermfg=6		cterm=none
highlight	FoldColumn		ctermbg=8		ctermfg=6		cterm=none
highlight	ModeMsg			ctermbg=none	ctermfg=2		cterm=none
highlight	MoreMsg			ctermbg=none	ctermfg=15		cterm=none
highlight	NonText			ctermbg=none	ctermfg=15		cterm=none
highlight	Pmenu			ctermbg=8		ctermfg=7		cterm=none
highlight	PmenuSel		ctermbg=4		ctermfg=0		cterm=none
highlight	PmenuSbar		ctermbg=8		ctermfg=none	cterm=none
highlight	PmenuThumb		ctermbg=15		ctermfg=none	cterm=none
highlight	Question		ctermbg=none	ctermfg=2		cterm=none
highlight	SpecialKey		ctermbg=none	ctermfg=15		cterm=none
highlight	SpellBad		ctermbg=1		ctermfg=0		cterm=none
highlight	SpellCap		ctermbg=1		ctermfg=0		cterm=none
highlight	SpellLocal		ctermbg=1		ctermfg=0		cterm=none
highlight	SpellRare		ctermbg=1		ctermfg=0		cterm=none

highlight	Comment			ctermbg=none	ctermfg=15		cterm=none
highlight	Constant		ctermbg=none	ctermfg=11		cterm=none
highlight	Identifier		ctermbg=none	ctermfg=3		cterm=none
highlight	Statement		ctermbg=none	ctermfg=4		cterm=none
highlight	Type			ctermbg=none	ctermfg=1		cterm=none
highlight	PreProc			ctermbg=none	ctermfg=2		cterm=none
highlight	Special			ctermbg=none	ctermfg=5		cterm=none
highlight	Underlined		ctermbg=none	ctermfg=6		cterm=none
highlight	Error			ctermbg=1		ctermfg=0		cterm=none
highlight	Todo			ctermbg=11		ctermfg=0		cterm=none
