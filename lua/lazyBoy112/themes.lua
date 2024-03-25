-- Speaial 
-- |-- bold
-- |-- underline
-- |-- undercurl	curly underline
-- |-- underdouble double underline
-- |-- underdotted dotted underline
-- |-- underdashed dashed underline
-- |-- strikethrough
-- |-- reverse
-- |-- inverse  same as reverse
-- |-- italic
-- |-- standout
-- |-- altfont
-- |-- nocombine override attributes instead of combining them
-- |-- NONE  no attributes used (used to reset it)

local mColor = require 'lazyBoy112.base'.mColor
local themes = {
  -- ['Conceal'] = {}, -- Placeholder charaters substituted for conceal
  -- ['Cursor'] = {}, 
  ['LineNr'] = { fg=mColor.yellow, bg=mColor.none },
  ['CursorLine'] = { fg=mColor.none, bg=mColor.cyan },
  ['CursorLineNr'] = { fg=mColor.black, bg=mColor.yellow, bold=true },
  -- ['Directory'] = {},
  -- ['DiffAdd'] = {},
  -- ['DiffChange'] = {},
  -- ['DiffDelete'] = {},
  -- ['DiffText'] = {},
  -- ['EndOfBuffer'] = {},
  -- ['TermCursor'] = {},
  -- ['TermCursorNC'] = {},
  -- ['ErrorMsg'] = {},
  ['WinSeparator'] = { fg=mColor.magenta, bg=mColor.none },
  ['Folded'] = { fg=mColor.l_yellow, bg=mColor.l_black, bold=true },
  ['FoldColumn'] = { fg=mColor.cyan, bg=mColor.none },
  ['SignColumn'] = { bg=mColor.none },
  ['Search'] = { fg=mColor.black, bg=mColor.blue }, -- last search pattern
  ['IncSearch'] = { fg=mColor.black, bg=mColor.magenta }, -- used for the text replaced with ':s///c'
  ['CurSearch'] = { fg=mColor.black, bg=mColor.l_green}, -- used for highlight search pattern under cursor
  -- ['Substitute'] = {}, -- substitute replacement text 
  -- ['CursorLineFold'] = {},
  -- ['CursorLineSign'] = {},
  -- ['MatchParen'] = {}, -- Character under the cursor is paired bracket and its match
  -- ['MsgArea'] = {}, -- area for messeages and cmdline
  -- ['MoreMsg'] = {},
  ['NonText'] = { fg=mColor.l_black, bg=mColor.none },
  ['Normal'] = { fg=mColor.l_white, bg=mColor.none },
  -- ['NormalFloat'] = { bg=mColor.black},
  -- ['FloatBorder'] = {},
  -- ['FloatTitle'] = {},
  -- ['NormalNC'] = {},
  ['Pmenu'] = { fg=mColor.magenta, bg=mColor.l_black },
  -- ['PmenuSel'] = {},
  -- ['PmenuSbar'] = {},
  -- ['Question'] = {}, -- yes/no question
  -- ['QuickFixLine'] = {}, -- current quickfix item in quickfix window
  -- ['SpecialKey'] = {}, -- not listchars
  -- ['Title'] = {},
  ['Visual'] = { reverse=true, bold=true },
  -- ['WarningMsg'] = {},
  -- ['Whitespace'] = {}, -- whitespace 'nbsp', 'space', 'tab', 'multispace', 'lead' and 'trail'
  -- ['Menu'] = {},
  -- ['Scrollbar'] = {},
  -- ['Tooltip'] = {},

  Identifier = { fg=mColor.l_blue, bg=mColor.none },
  ['Comment'] = { fg=mColor.l_black, bg=mColor.none },
  ['Constant'] = { fg=mColor.yellow, bold=true },
  ['Function'] = { fg=mColor.l_green }, -- function name
  ['Statement'] = { fg=mColor.l_blue }, -- any statement
  ['Conditional'] = { fg=mColor.magenta }, -- if/esle
  ['Repeat'] = { fg=mColor.magenta }, -- for, do, while
  -- ['Label'] = {}, -- case, default,..
  ['Operator'] = { fg=mColor.l_red },
  ['Keyword'] = { fg=mColor.l_magenta, italic=true },
  ['Exception'] = { fg=mColor.l_yellow }, -- try, catch, throw
  ['Define'] = { fg=mColor.green }, -- #define
  -- ['Macro'] = {}, -- same define
  -- ['PreCondit'] = {}, -- #if, #esle,...
  ['Type'] = { fg=mColor.l_cyan }, -- int, long, ...
  ['StorageClass'] = { fg=mColor.l_magenta }, -- static, register, ...
  ['Structure'] = { fg=mColor.l_green }, -- struct, union, enum
  ['Typedef'] = { fg=mColor.l_magenta, bold=true }, -- typedef
  ['Special'] = { fg=mColor.l_yellow }, -- Symbol
  -- ['SpecialChar'] = {}, -- special character in constant
  -- ['Tag'] = {}, -- use on tag
  ['Delimiter'] = { fg=mColor.l_cyan }, -- character need attention
  -- ['SpecialComment'] = {}, -- special in comment
  -- ['Debug'] = {}, -- debug statements
  ['Underlined'] = { fg=mColor.l_red, bold=true }, -- link (html link)
  -- ['Ignore'] = {}, -- left blank, hidden
  -- ['Todo'] = {},
  ['IndentLine'] = { link='Comment' },

  ['STmodeNormal'] = { fg=mColor.black, bg=mColor.green, bold=true },
  ['STsepRNormal'] = { fg=mColor.green, bg=mColor.none },
  ['STmodeInsert'] = { fg=mColor.black, bg=mColor.l_blue, bold=true },
  ['STsepRInsert'] = { fg=mColor.l_blue, bg=mColor.none },
  ['STmodeVisual'] = { fg=mColor.black, bg=mColor.l_magenta, bold=true },
  ['STsepRVisual'] = { fg=mColor.l_magenta, bg=mColor.none },
  ['STmodeCommand'] = { fg=mColor.black, bg=mColor.l_yellow, bold=true },
  ['STsepRCommand'] = { fg=mColor.l_yellow, bg=mColor.none },
  ['STmodeReplace'] = { fg=mColor.black, bg=mColor.l_red, bold=true },
  ['STsepRReplace'] = { fg=mColor.l_red, bg=mColor.none },
  ['STmodeTerminal'] = { fg=mColor.black, bg=mColor.l_cyan, bold=true },
  ['STsepRTerminal'] = { fg=mColor.l_cyan, bg=mColor.none },

  ['STgitBranch'] = { fg=mColor.yellow, bg=mColor.none, bold=true },
  ['STgitAdd'] = { fg=mColor.l_yellow, bg=mColor.none, bold=true },
  ['STgitRemove'] = { fg=mColor.l_red, bg=mColor.none, bold=true },
  ['STgitChange'] = { fg=mColor.green, bg=mColor.none, bold=true },

  ['LspSignError'] = { fg=mColor.l_red, bg=mColor.none },
  ['LspSignWarn'] = { fg=mColor.l_yellow, bg=mColor.none },
  ['LspSignInfo'] = { fg=mColor.white, bg=mColor.none },
  ['LspSignHint'] = { fg=mColor.l_green, bg=mColor.none },

  ['STlsp'] = { fg=mColor.green, bg=mColor.none },
  ['STsearch'] = { fg=mColor.l_green, bg=mColor.none},
  ['STfiletype'] = { fg=mColor.l_blue, bg=mColor.none },
  ['STsepL'] = { fg=mColor.l_green, bg=mColor.none},
  ['STline'] = { fg=mColor.black, bg=mColor.l_green },

  ['TabLine'] = { fg=mColor.l_white, bg=mColor.l_black },
  ['TabLineSel'] = { fg=mColor.l_green, bg=mColor.none},
  ['TabLineFill'] = { bg=mColor.l_black },
  ['TabLineSepActive'] = { fg=mColor.l_black, bg=mColor.none },
  ['TabLineSepInactive'] = { fg=mColor.l_black, bg=mColor.l_black },
  ['TabLineIcon'] = { fg=mColor.blue, bg=mColor.l_black },

  ['GitSignsAdd'] = { fg=mColor.l_green, bg=mColor.none },
  ['GitSignsChange'] = { fg=mColor.l_yellow, bg=mColor.none},
  ['GitSignsDelete'] = { fg=mColor.l_red, bg=mColor.none },
  ['GitSignsUntracked'] = { fg=mColor.l_magenta, bg=mColor.none },

  ['CmpItemMenu'] = { bg=mColor.black },
}


for hl_group, args in pairs(themes) do
  vim.api.nvim_set_hl(0, hl_group, args)
end

return themes
