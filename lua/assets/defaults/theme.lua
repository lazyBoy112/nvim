-- use vim.tbl_deep_extend("force", dest, source)
local M = {}
local color = require('core.utils.color')

M.colors = {
	none 			= 'none',
	black 		= '#000000',
	white 		= '#abb2bf',
	red 			= '#ef596f',
	orange 		= '#d19a66',
	yellow 		= '#e5c07b',
	green 		= '#89ca78',
	cyan 			= '#2bbac5',
	blue 			= '#61afef',
	purple 		= '#d55fde',
	gray 			= '#434852',
	highlight = '#e2be7d',
	comment 	= '#7f848e'
}

M.lighten = function ()
end


M.theme = {
	cursorline 									= color.lighten(M.colors.black, 0.09),
	color_column 								= color.lighten(M.colors.black, 0.088),
	fold 												= color.lighten(M.colors.black, 0.07),
	line_number 								= '#495162',
	indentline 									= color.lighten(M.colors.black, 0.12),
	selection 									= color.lighten(M.colors.black, 0.13),
	float_bg = '#0d121e',
	--float_bg 										= color.lighten(M.colors.black, 0.11),
	inlay_hint 									= color.darken(M.colors.gray, 0.07),

	git_add 										= "#109868",
	git_change 									= "#948B60",
	git_delete 									= "#9a353d",

	git_hunk_add 								= "#43554d",
	git_hunk_delete 						= "#502d30",
	git_hunk_add_inline 				= "#3f534f",
	git_hunk_change_inline 			= "#41483d",
	git_hunk_delete_inline 			= "#6f2e2d",

	diff_add 										= "#003e4a",
	diff_delete 								= "#501b20",
	diff_text 									= "#005869",

	bg_statusline 							= color.lighten(M.colors.black, 0.053),
	fg_gutter 									= color.lighten(M.colors.black, 0.095),
	fg_gutter_inactive 					= M.colors.white,

	virtual_text_error 					= color.lighten(M.colors.red, 0.093),
	virtual_text_warning 				= color.lighten(M.colors.yellow, 0.09),
	virtual_text_information 		= color.lighten(M.colors.blue, 0.102),
	virtual_text_hint 					= color.lighten(M.colors.cyan, 0.108),
}

M.groups = {
	ColorColumn = { bg = M.theme.color_column },
	Conceal = { fg = M.colors.white },
	Cursor = { bg = M.colors.purple, fg = M.colors.black },
  CursorColumn = { bg = M.colors.gray }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
	CursorLine = { bg = M.theme.cursorline and M.theme.cursorline or M.colors.black }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
	CursorLineNr = {
			bg = M.theme.cursorline  or M.colors.black,
			fg = M.colors.purple,
	}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
	CursorLineNrNC = { bg = M.theme.color_column, fg = M.colors.gray }, -- CursorLineNr for inactive windows
	CursorLineNrNCQuickFix = { bg = M.colors.black, fg = M.colors.purple }, -- CursorLineNr for inactive quickfix windows
	Directory = { fg = M.colors.blue }, -- directory names (and other special names in listings)
	DiffAdd = { bg = M.theme.diff_add, fg = "NONE" }, -- diff mode: Added line |diff.txt|
	DiffChange = { bg = "NONE", fg = "NONE" }, -- diff mode: Changed line |diff.txt|
	DiffDelete = { bg = M.theme.diff_delete, fg = "NONE" },
	DiffText = { bg = M.theme.diff_text, fg = "NONE" }, -- diff mode: Changed text within a changed line |diff.txt|
	EndOfBuffer = { fg = M.colors.black }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
	ErrorMsg = { fg = M.colors.red }, -- error messages on the command line
	VertSplit = { bg = M.colors.black, fg = M.colors.gray }, -- the column separating vertically split windows
	Folded = { bg = M.theme.fold, fg = M.colors.gray }, -- line used for closed folds
	FoldedNC = {
			bg = M.theme.color_column,
			fg = M.colors.gray,
	}, -- Folded for inactive windows
	FoldColumn = {
			bg = M.colors.black,
			fg = M.theme.line_number,
	}, -- 'foldcolumn'
	SignColumn = { bg =  M.colors.none }, -- column where |signs| are displayed
	SignColumnNC = {
			bg = M.theme.color_column,
			fg = M.colors.gray,
	}, -- SignColumn for inactive windows
	Substitute = { bg = M.colors.yellow, fg = M.colors.black }, -- |:substitute| replacement text highlighting
	LineNr = { bg = M.colors.none, fg = M.theme.line_number }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
	LineNrNC = {
			bg = M.theme.color_column,
			fg = M.theme.line_number,
	}, -- LineNr for inactive windows
	MatchParen = { fg = M.colors.cyan }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
	ModeMsg = { link = "Normal" }, -- 'showmode' message (e.g., "-- INSERT -- ")
	MsgArea = { link = "ModeMsg" }, -- Area for messages and cmdline
	MsgSeparator = { link = "ModeMsg" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
	MoreMsg = { fg = M.colors.green }, -- |more-prompt|
	NonText = { bg = M.colors.none, fg = M.colors.gray }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
	Normal = { bg = M.colors.none, fg = M.colors.white }, -- normal text
	NormalNC = {
			bg = M.colors.none,
			fg = M.colors.white,
	}, -- normal text in non-current windows
	NormalFloat = { bg = M.theme.float_bg }, -- Normal text in floating windows.
	FloatBorder = {
			bg = M.theme.float_bg,
			fg = M.colors.gray,
	},
	Pmenu = { bg = M.theme.float_bg }, -- Popup menu: normal item.
	PmenuSel = {
			bg = color.lighten(M.theme.float_bg, 0.1),
			bold = true
	}, -- Popup menu: selected item.
	PmenuSbar = {
			bg = color.darken(M.colors.green, 0.03),
	}, -- Popup menu: scrollbar.
	PmenuThumb = {
			bg = color.lighten(M.colors.green, 0.05),
	}, -- Popup menu: Thumb of the scrollbar.
	Question = { bg = M.colors.black, fg = M.colors.gray }, -- |hit-enter| prompt and yes/no questions
	QuickFixLine = { bg = M.theme.cursorline }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
	QuickFixLineNC = { bg = M.colors.black }, -- QuickFixLine, for inactive windows
	Search = { bg = M.theme.selection, fg = M.colors.yellow }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
	-- SpecialKey   = {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace| SpellBad  Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.  SpellCap  Word that should start with a capital. |spell| Combined with the highlighting used otherwise.  SpellLocal  Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
	-- SpellRare    = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
	IncSearch = { bg = M.theme.selection, fg = M.colors.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
	StatusLine = {
			bg = M.colors.none,
			fg = M.colors.white,
			bold = true,
	}, -- status line of current window
	StatusLineNC = {
			bg = M.colors.black,
			fg = M.colors.white,
	}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
	TabLine = { bg = M.colors.black }, -- tab pages line, not active tab page label
	TabLineFill = { bg = M.colors.black, fg = M.colors.white }, -- tab pages line, where there are no labels
	TabLineSel = { bg = M.colors.purple, fg = M.colors.black }, -- tab pages line, active tab page label
	TermCursor = { bg = M.colors.purple }, -- cursor in a focused terminal
	TermCursorNC = { bg = M.colors.gray }, -- cursor in an unfocused terminal
	Title = { fg = M.colors.green }, -- titles for output from ":set all", ":autocmd"
	Visual = { bg = M.theme.selection }, -- Visual mode selection
	VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
	WarningMsg = { fg = M.colors.yellow }, -- warning messages
	WinBar = { bg = M.colors.black, fg = M.colors.white },
	WinBarNC = {
			bg = M.colors.black,
			fg = M.colors.white,
	},
	WinSeparator = { bg = M.colors.black, fg = M.colors.gray }, -- the column separating windows
	Whitespace = { fg = M.colors.gray }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
	WildMenu = { bg = M.colors.blue, fg = M.colors.black }, -- current match in 'wildmenu' completion

	-- Syntax groups

	-- Git
	diffFile = { fg = M.theme.git_change },
	diffNewFile = { fg = M.theme.git_change },
	diffLine = { fg = M.colors.blue },

	-- Spelling
	SpellBad = { fg = M.colors.red, sp = M.colors.red, undercurl = true },
	SpellCap = { fg = M.colors.red, sp = M.colors.red, undercurl = true },
	SpellLocal = { fg = M.colors.red, sp = M.colors.red, undercurl = true },
	SpellRare = { fg = M.colors.red, sp = M.colors.red, undercurl = true },

	-- Syntax
	Comment = { fg = M.theme.comment }, -- Comments
	Constant = { fg = M.colors.orange }, -- (preferred) any constant
	String = { fg = M.colors.green }, --   a string constant: "this is a string"
	Character = { fg = M.colors.green }, -- a character constant: 'c', '\n'
	Number = { fg = M.colors.orange }, -- a number constant: 234, 0xff
	Float = { fg = M.colors.orange }, -- a floating point constant: 2.3e10
	Boolean = { fg = M.colors.orange }, -- a boolean constant: TRUE, false

	Identifier = { fg = M.colors.red}, -- (preferred) any variable name
	Function = { fg = M.colors.blue }, -- function name (also: methods for classes)

	Statement = { fg = M.colors.purple }, -- (preferred) any statement
	Conditional = { fg = M.colors.purple }, --  if, then, else, endif, switch, etc
	Repeat = { fg = M.colors.purple }, -- for, do, while, etc
	Label = { fg = M.colors.purple }, -- case, default, etc

	Operator = { fg = M.colors.cyan }, -- "sizeof", "+", "*", etc
	Keyword = { fg = M.colors.purple }, -- any other keyword
	Exception = { link = "Keyword" }, -- try, catch, throw

	PreProc = { fg = M.colors.yellow }, -- (preferred) generic Preprocessor
	Include = { fg = M.colors.purple }, -- preprocessor #include
	Define = { fg = M.colors.purple }, -- preprocessor #define
	Macro = { fg = M.colors.blue }, -- same as Define
	PreCondit = { fg = M.colors.yellow }, -- preprocessor #if, #else, #endif, etc

	Type = { fg = M.colors.yellow }, -- (preferred) int, long, char, etc
	StorageClass = { fg = M.colors.yellow }, -- static, register, volatile, etc
	Structure = { fg = M.colors.purple }, -- struct, union, enum, etc
	Typedef = { fg = M.colors.purple }, -- A typedef

	Special = { fg = M.colors.blue }, -- (preferred) any special symbol
	SpecialChar = { fg = M.colors.orange }, -- special character in a constant
	-- Tag = {}, -- you can use CTRL-] on this
	Delimiter = { fg = M.colors.white }, -- character that needs attention
	SpecialComment = { fg = M.theme.comment }, -- special things inside a comment
	-- Debug = {}, -- debugging statements

	Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
	Bold = { bold = true },
	-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|
	Italic = { italic = true },

	Error = { fg = M.colors.red }, -- (preferred) any erroneous construct
	Todo = { fg = M.colors.purple }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

	qfLineNr = { link = "LineNr" },
	qfFileName = { link = "Directory" },

	-- C/C++
	["@character.printf"] = { fg = M.colors.orange },

	["@constant.c"] = { fg = M.colors.yellow },
	["@constant.builtin.c"] = { fg = M.colors.yellow },
	["@function.builtin.c"] = { fg = M.colors.cyan },
	["@label.c"] = { fg = M.colors.red },
	["@type.builtin.c"] = { fg = M.colors.purple },
	["@type.qualifier.c"] = { fg = M.colors.purple },
	["@variable.parameter.c"] = { fg = M.colors.red },

	-- LSP Semantic Tokens
	["@lsp.type.macro.c"] = { fg = M.colors.orange },
	["@lsp.typemod.function.defaultLibrary.c"] = { fg = M.colors.cyan },
	["@lsp.typemod.variable.readonly.c"] = { fg = M.colors.yellow },

	-- Comment
	["@odp.uri.comment"] = { link = "@text.uri.comment" },

	-- Html
	["@operator.html"] = { fg = M.colors.white },
	["@tag.attribute.html"] = { fg = M.colors.orange },
	["@string.special.url.html"] = { fg = M.colors.green, underline = true },
	["@text.uri.html"] = { fg = M.colors.green, underline = true },

	-- Go
	["@constant.go"] = { fg = M.colors.red },
	["@function.call.go"] = { fg = M.colors.blue },
	["@method.call.go"] = { fg = M.colors.blue },
	["@function.builtin.go"] = { fg = M.colors.cyan },
	["@operator.go"] = { fg = M.colors.cyan },
	["@type.go"] = { fg = M.colors.yellow },
	["@type.builtin.go"] = { fg = M.colors.purple },
	["@field.go"] = { fg = M.colors.red },
	["@property.go"] = { fg = M.colors.red },
	["@variable.go"] = { fg = M.colors.red },
	["@parameter.go"] = { fg = M.colors.red },

	-- Java
	["@type.qualifier.java"] = { fg = M.colors.purple },
	["@type.builtin.java"] = { fg = M.colors.purple },

	-- Javascript
	["@constructor.javascript"] = { fg = M.colors.yellow },
	["@keyword.javascript"] = { fg = M.colors.purple },
	["@keyword.return.javascript"] = { fg = M.colors.purple },
	["@method.javascript"] = { fg = M.colors.blue },
	["@method.call.javascript"] = { link = "@method.javascript" },
	["@variable.javascript"] = { fg = M.colors.red },
	["@variable.builtin.javascript"] = { fg = M.colors.yellow },

	["@odp.operator.fat_arrow.javascript"] = { fg = M.colors.purple },
	["@odp.jsxtag.javascript"] = { fg = M.colors.orange },
	["@odp.expression.punctuation.bracket.javascript"] = { fg = M.colors.cyan },
	["@odp.function.punctuation.bracket.javascript"] = { fg = M.colors.blue },
	["@odp.punctuation.bracket.javascript"] = { fg = M.colors.orange },
	["@odp.statement.punctuation.bracket.javascript"] = { fg = M.colors.purple },

	-- LSP Semantic Tokens
	["@lsp.type.class.javascript"] = { fg = M.colors.yellow },
	["@lsp.type.namespace.javascript"] = { fg = M.colors.yellow },
	["@lsp.typemod.variable.defaultLibrary.javascript"] = { fg = M.colors.yellow },
	["@lsp.type.member.javascript"] = { fg = M.colors.blue },

	-- JSON
	["@label.json"] = { fg = M.colors.red },

	["@odp.braces.json"] = { fg = M.colors.cyan },
	["@odp.brackets.json"] = { fg = M.colors.orange },

	-- Lua
	["@function.builtin.lua"] = { fg = M.colors.cyan },
	["@function.call.lua"] = { fg = M.colors.blue },
	["@field.lua"] = { fg = M.colors.white },
	["@keyword.lua"] = { fg = M.colors.purple },
	["@keyword.function.lua"] = { fg = M.colors.purple },
	["@keyword.operator.lua"] = { fg = M.colors.white },
	["@method.lua"] = { fg = M.colors.blue },
	["@operator.lua"] = { fg = M.colors.white },
	["@parameter.lua"] = { fg = M.colors.white },
	["@punctuation.bracket.lua"] = { fg = M.colors.orange },
	["@punctuation.bracket.luadoc"] = { fg = M.colors.comment },

	["@odp.class.lua"] = { fg = M.colors.yellow },
	["@odp.function_assignment.lua"] = { link = "@function" },
	["@odp.plenary_function.lua"] = { link = "@function" },

	-- LSP Semantic Tokens
	["@lsp.typemod.function.defaultLibrary.lua"] = { fg = M.colors.cyan },
	["@lsp.typemod.variable.defaultLibrary.lua"] = { fg = M.colors.yellow },

	-- Markdown
	["@markup.heading"] = { fg = M.colors.red },
	["@markup.quote.markdown"] = { fg = M.colors.comment },
	["@text.title.markdown"] = { fg = M.colors.red, bold = true },
	["@markup.list.markdown"] = { fg = M.colors.yellow },
	["@label.markdown"] = { fg = M.colors.white },
	["@markup.raw.delimiter.markdown"] = { fg = M.colors.white },
	["@punctuation.special.markdown"] = { fg = M.colors.comment },

	["@markup.strong.markdown_inline"] = { fg = M.colors.orange, bold = true },
	["@markup.italic.markdown_inline"] = { fg = M.colors.purple, italic = true },
	["@markup.raw.delimiter.markdown_inline"] = { fg = M.colors.yellow },
	["@parameter.markdown_inline"] = { fg = M.colors.white },
	["@punctuation.delimiter.markdown_inline"] = { fg = M.colors.orange },
	["@text.literal.markdown_inline"] = { fg = M.colors.green },
	["@text.reference.markdown_inline"] = { fg = M.colors.blue },
	["@text.strong.markdown_inline"] = { fg = M.colors.orange, bold = true },
	["@text.uri.markdown_inline"] = { fg = M.colors.purple },

	-- Php
	["@method.php"] = { fg = M.colors.blue },
	["@method.call.php"] = { link = "@method.php" },
	["@function.builtin.php"] = { fg = M.colors.cyan },
	["@namespace.php"] = { fg = M.colors.yellow },
	["@constant.builtin.php"] = { fg = M.colors.orange },
	["@type.qualifier.php"] = { link = "@keyword.function" },

	-- Python
	["@conditional.python"] = { fg = M.colors.purple },
	["@constant.builtin.python"] = { fg = M.colors.orange },
	["@keyword.function.python"] = { fg = M.colors.purple },
	["@include.python"] = { fg = M.colors.purple },
	["@method.call.python"] = { fg = M.colors.blue },
	["@variable.builtin.python"] = { fg = M.colors.yellow },
	["@punctuation.bracket.python"] = { fg = M.colors.orange },

	["@odp.base_constructor.python"] = { fg = M.colors.cyan },
	["@odp.constructor.python"] = { link = "@constructor" },
	["@odp.decorator.python"] = { link = "@function" },
	["@odp.decorator.function.python"] = { link = "@function" },
	["@odp.function.builtin.python"] = { link = "@function.builtin" },
	["@odp.import_from.python"] = { fg = M.colors.purple },
	["@odp.import_module.python"] = { fg = M.colors.white },
	["@odp.interpolation.python"] = { fg = M.colors.red },
	["@odp.keyword.class.python"] = { link = "@keyword.function.python" },
	["@odp.operator.splat.python"] = { fg = M.colors.white },
	["@odp.punctuation.bracket.python"] = { fg = M.colors.orange },
	["@odp.punctuation.special.python"] = { fg = M.colors.purple },

	-- ruby
	["@constant.builtin.ruby"] = { fg = M.colors.orange },
	["@function.ruby"] = { fg = M.colors.blue },
	["@function.call.ruby"] = { fg = M.colors.blue },
	["@include.ruby"] = { fg = M.colors.blue },
	["@keyword.function.ruby"] = { link = "@keyword.ruby" },
	["@label.ruby"] = { fg = M.colors.red },
	["@parameter.ruby"] = { fg = M.colors.white },
	["@punctuation.bracket.ruby"] = { fg = M.colors.orange },
	["@symbol.ruby"] = { fg = M.colors.cyan },

	["@odp.colon.ruby"] = { fg = M.colors.orange },
	["@odp.pipe.ruby"] = { fg = M.colors.white },
	["@odp.puts.ruby"] = { fg = M.colors.cyan },

	-- Rust
	["@constant.builtin.rust"] = { fg = M.colors.yellow },
	["@field.rust"] = { fg = M.colors.red },
	["@function.macro.rust"] = { link = "Function" },
	["@operator.rust"] = { fg = M.colors.white },
	["@storageclass.rust"] = { link = "@keyword" },
	["@punctuation.bracket.rust"] = { fg = M.colors.orange },
	["@type.qualifier.rust"] = { fg = M.colors.purple },
	["@variable.rust"] = { fg = M.colors.red },

	["@odp.punctuation_arguments_brackets.rust"] = { fg = M.colors.purple },
	["@odp.punctuation_token_bracket.rust"] = { fg = M.colors.cyan },

	-- LSP Semantic Tokens
	["@lsp.type.builtinAttribute.rust"] = { link = "Function" },
	["@lsp.type.attributeBracket.rust"] = { link = "@punctuation.bracket.rust" },
	["@lsp.type.generic.rust"] = { fg = M.colors.red },

	-- Css 
	["@property.scss"] = { fg = M.colors.white },
	["@punctuation.bracket.scss"] = { fg = M.colors.orange },
	["@string.scss"] = { fg = M.colors.orange },
	["@type.scss"] = { fg = M.colors.red },

	["@odp.nesting_selector.scss"] = { fg = M.colors.red },
	["@odp.pseudo_class.scss"] = { fg = M.colors.cyan },
	["@odp.selector.scss"] = { fg = M.colors.orange },
	["@odp.variable.scss"] = { fg = M.colors.red },
	["@odp.vendor_prefix.scss"] = { fg = M.colors.cyan },

	-- Toml
	["@operator.toml"] = { fg = M.colors.white },
	["@property.toml"] = { fg = M.colors.purple },

	-- Typescript
	["@function.typescript"] = { fg = M.colors.blue },
	["@function.call.typescript"] = { fg = M.colors.blue },
	["@method.typescript"] = { fg = M.colors.blue },
	["@method.call.typescript"] = { fg = M.colors.blue },
	["@parameter.typescript"] = { fg = M.colors.red },
	["@punctuation.bracket.typescript"] = { fg = M.colors.orange },
	["@variable.typescript"] = { fg = M.colors.red },
	["@variable.builtin.typescript"] = { fg = M.colors.yellow },

	["@odp.operator.fat_arrow.typescript"] = { fg = M.colors.purple },
	["@odp.property.function.typescript"] = { link = "@function.typescript" },

	-- LSP Semantic Tokens
	["@lsp.type.enum.typescript"] = { fg = M.colors.yellow },
	["@lsp.type.interface.typescript"] = { fg = M.colors.yellow },
	["@lsp.typemod.enumMember.declaration.typescript"] = { fg = M.colors.cyan },
	["@lsp.mod.readonly.typescript"] = { fg = M.colors.yellow },
	["@lsp.mod.defaultLibrary.typescript"] = { fg = M.colors.yellow },
	["@lsp.typemod.member.defaultLibrary.typescript"] = { link = "@function.typescript" },
	["@lsp.typemod.enumMember.readonly.typescript"] = { fg = M.colors.cyan },

	-- TypeScriptReact
	["@function.tsx"] = { fg = M.colors.blue },
	["@function.call.tsx"] = { fg = M.colors.blue },
	["@parameter.tsx"] = { fg = M.colors.red },
	["@punctuation.bracket.tsx"] = { fg = M.colors.orange },
	["@tag.attribute.tsx"] = { fg = M.colors.orange },
	["@type.builtin.tsx"] = { fg = M.colors.purple },

	-- Vue
	["@method.vue"] = { fg = M.colors.orange },
	["@operator.vue"] = { fg = M.colors.white },
	["@tag.attribute.vue"] = { fg = M.colors.orange },

	-- Xml
	["xmlAttrib"] = { fg = M.colors.orange },
	["xmlTag"] = { fg = M.colors.white },
	["xmlTagName"] = { fg = M.colors.red },

	-- Yaml
	["@field.yaml"] = { fg = M.colors.red },
	["@function.call.yaml"] = { fg = M.colors.green },
	["@punctuation.bracket.yaml"] = { fg = M.colors.orange },
	["@parameter.yaml"] = { fg = M.colors.green },
	["@string.yaml"] = { fg = M.colors.green },

	-- Gitsign
	GitSignsAdd = { fg = M.theme.git_add },
	GitSignsAddCursorLine = { fg = M.theme.git_add, bg = M.colors.cursorline },
	GitSignsChange = { fg = M.theme.git_change },
	GitSignsChangeCursorLine = { fg = M.theme.git_change, bg = M.colors.cursorline },
	GitSignsDelete = { fg = M.theme.git_delete },
	GitSignsDeleteCursorLine = { fg = M.theme.git_delete, bg = M.colors.cursorline },
	GitSignsUntracked = { fg = M.colors.blue },
	GitSignsUntrackedCursorLine = { fg = M.colors.blue, bg = M.theme.cursorline },

	GitSignsAddPreview = { bg = M.theme.git_hunk_add },
	GitSignsDeletePreview = { bg = M.theme.git_hunk_delete },
	GitSignsAddInline = { bg = M.theme.git_hunk_add_inline },
	GitSignsChangeInline = { bg = M.theme.git_hunk_change_inline },
	GitSignsDeleteInline = { bg = M.theme.git_hunk_delete_inline },

	-- GitSign
	LspSagaDiagnosticBorder = { link = "NormalNC" },
	LspSagaDiagnosticHeader = { fg = M.colors.purple },
	LspSagaDiagnosticTruncateLine = { link = "NormalNC" },
	LspFloatWinBorder = { link = "NormalNC" },
	LspSagaBorderTitle = { link = "Title" },
	TargetWord = { link = "Error" },
	ReferencesCount = { link = "Title" },
	ReferencesIcon = { link = "Special" },
	DefinitionCount = { link = "Title" },
	TargetFileName = { fg = M.colors.gray },
	DefinitionIcon = { link = "Special" },
	ProviderTruncateLine = { link = "NormalNC" },
	SagaShadow = {},
	LspSagaFinderSelection = { link = "Search" },
	DiagnosticTruncateLine = { link = "NormalNC" },
	DefinitionPreviewTitle = { link = "Title" },
	LspSagaShTruncateLine = { link = "NormalNC" },
	LspSagaDocTruncateLine = { link = "NormalNC" },
	LineDiagTuncateLine = { link = "NormalNC" },
	LspSagaCodeActionTitle = { link = "Title" },
	LspSagaCodeActionTruncateLine = { link = "NormalNC" },
	LspSagaCodeActionContent = { link = "Normal" },
	LspSagaRenamePromptPrefix = { fg = M.colors.purple },

	-- Nvim dap
	DebugBreakpoint = { fg = M.colors.red },
	DebugBreakpointLine = { fg = M.colors.red },
	DebugHighlight = { fg = M.colors.blue },
	DebugHighlightLine = { fg = M.colors.purple },
	NvimDapVirtualText = { fg = M.colors.cyan }, 

	-- Nvim_dap_ui
	DapUIScope = { bg = M.colors.blue, fg = M.colors.black },
	DapUIType = { fg = M.colors.blue },
	DapUIDecoration = { fg = M.colors.blue },
	DapUIModifiedValue = { fg = M.colors.cyan },
	DapUIThread = { fg = M.colors.purple },
	DapUIStoppedThread = { bg = M.colors.purple, fg = M.colors.black },
	DapUIFloatBorder = { bg = M.colors.black, fg = M.colors.gray },
	DapUILineNumber = { fg = M.colors.gray },
	DapUIFrameName = { fg = M.colors.white },
	DapUISource = { fg = M.colors.purple },
	DapUIBreakpointsPath = { bg = M.colors.yellow, fg = M.colors.black },
	DapUIBreakpointsInfo = { fg = M.colors.white },
	DapUIBreakpointsCurrentLine = { fg = M.colors.yellow },
	DapUIBreakpointsLine = { link = "DapUIBreakpointsCurrentLine" },
	DapUIWatchesEmpty = { bg = M.colors.red, fg = M.colors.black },
	DapUIWatchesValue = { fg = M.colors.red },
	DapUIWatchesError = { fg = M.colors.red },

	-- Telescope
	TelescopeSelection = {
			bg = M.colors.black,
			fg = M.colors.purple,
	},
	TelescopeSelectionCaret = { fg = M.colors.purple },
	TelescopeMultiSelection = {
			bg = M.colors.black,
			fg = M.colors.gray,
	},
	TelescopeNormal = {
			bg = M.theme.float_bg,
			fg = M.colors.white,
	},
	TelescopeBorder = {
			bg = M.theme.float_bg,
			fg = M.colors.gray,
	},
	TelescopePromptNormal = { link = "TelescopeNormal" },
	TelescopePromptBorder = { link = "TelescopeBorder" },
	TelescopePreviewBorder = { link = "TelescopeBorder" },
	TelescopePromptPrefix = { fg = M.colors.purple },
	TelescopeMatching = { fg = M.colors.green },

	-- TreeSitter
	["@variable"] = { fg = M.colors.red }, -- various variable names
	["@variable.builtin"] = { fg = M.colors.yellow }, -- built-in variable names (e.g. `this`)
	["@variable.parameter"] = { fg = M.colors.red }, -- parameters of a function
	["@variable.member"] = { fg = M.colors.red }, -- object and struct fields

	["@constant"] = { fg = M.colors.orange }, -- constant identifiers
	["@constant.builtin"] = { fg = M.colors.purple }, -- built-in constant values
	["@constant.macro"] = { link = "@constant" }, -- constants defined by the preprocessor

	["@module"] = { fg = M.colors.yellow }, -- modules or namespaces
	["@label"] = { link = "Label" }, -- GOTO and other labels (e.g. `label:` in C)

	-- Literals
	["@string"] = { fg = M.colors.green }, -- string literals
	["@string.regex"] = { fg = M.colors.green }, -- regular expressions
	["@string.escape"] = { fg = M.colors.cyan }, -- escape sequences
	["@string.special"] = { link = "Special" }, -- other special strings (e.g. dates)
	["@string.special.symbol"] = { fg = M.colors.red }, -- symbols or atoms
	["@string.special.url"] = { fg = M.colors.blue, italic = true, underline = true }, -- URIs (e.g. hyperlinks)

	["@character"] = { link = "Character" }, -- character literals
	["@character.special"] = { fg = M.colors.purple }, -- special characters (e.g. wildcards)

	["@boolean"] = { link = "Boolean" }, -- boolean literals
	["@number"] = { link = "Number" }, -- numeric literals
	["@number.float"] = { link = "Float" }, -- floating-point number literals

	-- Types
	["@type"] = { link = "Type" }, -- type or class definitions and annotations
	["@type.builtin"] = { link = "@type" }, -- built-in types
	["@type.definition"] = { link = "@type" }, -- type definitions (e.g. `typedef` in C)
	["@type.qualifier"] = { link = "@type" }, -- type qualifiers (e.g. `const`)

	["@attribute"] = { fg = M.colors.purple }, --attribute annotations (e.g. Python decorators)
	["@property"] = { fg = M.colors.red }, -- similar to `@field`

	-- Functions
	["@function"] = { fg = M.colors.blue }, -- function definitions
	["@function.builtin"] = { fg = M.colors.yellow }, -- built-in functions
	["@function.call"] = { link = "@function" }, -- function calls
	["@function.macro"] = { fg = M.colors.blue }, -- preprocessor macros

	["@function.method"] = { fg = M.colors.blue }, -- method definitions
	["@function.method.call"] = { link = "@function.method" }, -- method calls

	["@constructor"] = { fg = M.colors.yellow }, -- constructor calls and definitions
	["@operator"] = { fg = M.colors.cyan }, -- symbolic operators (e.g. `+` / `*`)

	-- Keywords
	["@keyword"] = { link = "Keyword" }, -- For keywords that don't fall in previous categories.
	["@keyword.function"] = { fg = M.colors.purple }, -- For keywords used to define a function.
	["@keyword.operator"] = { fg = M.colors.purple }, -- For operators that are English words, e.g. `and`, `as`, `or`.
	["@keyword.import"] = { link = "@keyword" }, -- keywords for including modules (e.g. `import` / `from` in Python)
	["@keyword.repeat"] = { link = "@keyword" }, -- keywords related to loops (e.g. `for` / `while`)
	["@keyword.return"] = { link = "@keyword" }, -- for the `return` and `yield` keywords.
	["@keyword.exception"] = { link = "@keyword" }, -- keywords related to exceptions (e.g. `throw` / `catch`)

	["@keyword.conditional"] = { fg = M.colors.purple }, -- keywords related to conditionals (e.g. `if` / `else`)

	-- Punctuation
	["@punctuation.delimiter"] = { link = "Delimiter" }, -- delimiters (e.g. `;` / `.` / `,`)
	["@punctuation.bracket"] = { fg = M.colors.purple }, -- brackets (e.g. `()` / `{}` / `[]`)
	["@punctuation.special"] = { fg = M.colors.white }, -- special symbols (e.g. `{}` in string interpolation)

	-- Comments
	["@comment"] = { link = "Comment" }, -- line and block comments
	["@comment.error"] = { bg = M.colors.red, fg = M.colors.black }, -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED:`)
	["@comment.warning"] = { bg = M.colors.yellow, fg = M.colors.black }, -- warning-type comments (e.g. `WARNING:`, `FIX:`, `HACK:`)
	["@comment.todo"] = { bg = M.colors.blue, fg = M.colors.black }, -- todo-type comments (e.g. `TODO:`, `WIP:`, `FIXME:`)
	["@comment.note"] = { bg = M.colors.cyan, fg = M.colors.black }, -- note-type comments (e.g. `NOTE:`, `INFO:`, `XXX`)

	-- Markup
	["@markup.strong"] = { fg = M.colors.yellow, bold = true }, -- bold text
	["@markup.italic"] = { italic = true }, -- italic text
	["@markup.strikethrough"] = { strikethrough = true }, -- struck-through text
	["@markup.underline"] = { underline = true }, -- underlined text (only for literal underline markup!)


	["@markup.math"] = { link = "Special" }, -- math environments (e.g. `$ ... $` in LaTeX)

	["@markup.link.label"] = { fg = M.colors.blue }, -- link, reference descriptions
	["@markup.link.url"] = { fg = M.colors.purple }, -- URL-style links

	["@markup.raw"] = { fg = M.colors.green }, -- literal or verbatim text (e.g. inline code)
	["@markup.raw.delimiter"] = { fg = M.colors.gray },

	["@markup.list"] = { fg = M.colors.red }, -- list markers
	["@markup.list.checked"] = { fg = M.colors.purple }, -- checked todo-style list markers
	["@markup.list.unchecked"] = { fg = M.colors.white }, -- unchecked todo-style list markers

	-- Tags
	["@tag"] = { fg = M.colors.red }, -- XML tag names
	["@tag.attribute"] = { link = "@property" }, -- XML tag attributes
	["@tag.delimiter"] = { link = "Delimiter" }, -- XML tag delimiters

	-- Whichkey
	WhichKey = { fg = M.colors.purple },
	WhichKeyDesc = { fg = M.colors.white },
	WhichKeySeparator = { fg = M.colors.green },
	WhichKeyFloat = { bg = M.theme.cursorline },
	WhichKeyGroup = { fg = M.colors.blue },

  -- StatusLine
  STmodeNormal = { fg=M.colors.black, bg=M.colors.green, bold=true },
  STmodeVisual = { fg=M.colors.black, bg=M.colors.purple, bold=true },
  STmodeSelect = { fg=M.colors.black, bg=M.colors.yellow, bold=true },
  STmodeInsert = { fg=M.colors.black, bg=M.colors.blue, bold=true },
  STmodeReplace = { fg=M.colors.black, bg=M.colors.red, bold=true },
  STmodeCommand = { fg=M.colors.black, bg=M.colors.orange, bold=true },
  STmodeTerminal = { fg=M.colors.black, bg=M.colors.cyan, bold=true },
  STsepRNormal = { fg=M.colors.green, bg=M.colors.none },
  STsepRVisual = { fg=M.colors.purple, bg=M.colors.none },
  STsepRSelect = { fg=M.colors.yellow, bg=M.colors.none },
  STsepRInsert = { fg=M.colors.blue, bg=M.colors.none },
  STsepRReplace = { fg=M.colors.red, bg=M.colors.none },
  STsepRCommand = { fg=M.colors.orangeen, bg=M.colors.none },
  STsepRTerminal = { fg=M.colors.cyan, bg=M.colors.none },
  STline = { fg=M.colors.cyan, bg=M.colors.none, bold=true },
  STsearch = { fg=M.colors.red, bg=M.colors.none, bold=false },
  STlsp = { fg=M.colors.purple, bg=M.colors.none },
  LspSignError = { fg=M.colors.red, bg=M.colors.none },
  LspSignWarn = { fg=M.colors.yellow, bg=M.colors.none },
  LspSignHint = { fg=color.lighten(M.colors.green, 0.4), bg=M.colors.none },
  LspSignInfo = { fg=M.colors.gray, bg=M.colors.none },
}

return M
