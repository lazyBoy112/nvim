local status, buddy = pcall(require, 'colorbuddy')
if not status then return end

local Color, colors, Group, groups, styles = buddy.setup()
-- Define colors
Color.new('black'       , '#181920')
Color.new('red'         , '#FA5F55')
Color.new('green'       , '#8FCA9A')
Color.new('yellow'      , '#F7EFAE')
Color.new('blue'        , '#4a00aa')
Color.new('magenta'     , '#BF40BF')
Color.new('cyan'        , '#62ccc3')
Color.new('white'       , '#708090')
Color.new('lightBlack'  , '#414A5F')
Color.new('lightRed'    , '#E39194')
Color.new('lightGreen'  , '#32CD32')
Color.new('lightYellow' , '#EFAA8E')
Color.new('lightBlue'   , '#77ABE7')
Color.new('lightMagenta', '#CAA6EC')
Color.new('lightCyan'   , '#A2C6EF')
Color.new('lightWhite'  , '#D3D3D3')

Color.new('superYellow' , '#ffff00')
Color.new('superRed'    , '#ff0000')
Color.new('superGreen'  , '#00ff00')
Color.new('superWhite'  , '#ffffff')

Color.new('bisCuit'     , '#353535')


-- ----------------------------------------


Group.new('SignColumn'                  , colors.none, colors.none, styles.none)
Group.new('LineNr'                      , colors.lightwhite, colors.none, styles.none)
Group.new('CursorLineNr'                , colors.lightwhite, colors.lightblack, styles.bold)
Group.new('CursorLine'                  , nil, colors.lightblack, styles.none)
Group.new('Normal'                      , nil, colors.black, styles.none)
Group.new('Visual'                      , nil, nil, styles.reverse)
Group.new('CurSearch'                   , colors.black, colors.lightgreen, styles.none)
Group.new('Search'                      , colors.lightgreen, colors.lightblack, styles.none)
Group.new('WinSeparator'                , colors.white, colors.black, styles.bold)

Group.new('Pmenu'                       , colors.green, colors.lightblack, styles.none)
Group.new('PmenuSel'                    , nil, colors.white, styles.bold + styles.italic)
Group.new('PmenuSBar'                   , colors.lightmagenta, colors.lightblack, styles.bold + styles.italic)
Group.new('PmenuThumb'                  , nil, colors.lightmagenta, styles.bold + styles.italic)
Group.new('TabLineFill'                 , colors.lightblack, colors.lightblack, nil)

Group.new('Comment'                     , colors.white, colors.none, styles.italic)
Group.new('Type'                        , colors.lightmagenta, colors.none, styles.bold)
Group.new('Identifier'                  , colors.lightcyan, colors.none, styles.none)
Group.new('Constant'                    , colors.red, colors.none, styles.bold)
Group.new('Function'                    , colors.cyan, colors.none, styles.none)
Group.new('Statement'                   , colors.yellow, colors.none, styles.none)
Group.new('Conditional'                 , colors.lightmagenta, colors.none, styles.bold)
Group.new('Repeat'                      , colors.lightmagenta, colors.none, styles.bold)
Group.new('Label'                       , colors.magenta, colors.none, styles.bold)
Group.new('Operator'                    , colors.yellow, colors.none, styles.bold)
Group.new('Keyword'                     , colors.green, colors.none, styles.italic)
Group.new('Exception'                   , colors.lightyellow, colors.none, styles.bold)
Group.new('Structure'                   , colors.lightmagenta, colors.none, styles.bold)
Group.new('Delimiter'                   , colors.lightred, colors.none, styles.bold)
Group.new('Folded'                      , colors.lightyellow, colors.none, styles.bold)
Group.new('MatchParen'                  , nil, colors.yellow, styles.bold)
-- MsgArea, MsgSeparator

Group.new('TelescopeNormal'             , nil, colors.lightblack, styles.none)
Group.new('TelescopeBorder'             , colors.green, nil, styles.bold)
Group.new('TelescopePromptBorder'       , colors.green, colors.lightblack, styles.bold)
Group.new('TelescopeResultsBorder'      , colors.green, colors.lightblack, styles.bold)
Group.new('TelescopePreviewTitle'       , colors.lightblue, nil, styles.none)
Group.new('TelescopePromptTitle'        , colors.lightblue, nil, styles.none)
Group.new('TelescopePromptCounter'      , colors.lightmagenta, nil, styles.bold)
Group.new('TelescopePromptPrefix'       , colors.lightmagenta, nil, styles.bold)

Group.new('CmpItemKind'                 , colors.green, nil, nil)
Group.new('CmpItemKindVariable'         , colors.lightblue, nil, nil)
Group.new('CmpItemKindFunction'         , colors.lightmagenta, nil, nil)
Group.new('CmpItemKindMethod'           , colors.lightmagenta, nil, nil)
Group.new('CmpItemKindConstant'         , colors.lightred, nil, nil)
Group.new('CmpItemKindClass'            , colors.lightcyan, nil, nil)

Group.new('DiagnosticVirtualTextError'  , colors.red, nil, nil)
Group.new('DiagnosticVirtualTextWarn'   , colors.yellow, nil, nil)
Group.new('DiagnosticVirtualTextHint'   , colors.green, nil, nil)
Group.new('DiagnosticVirtualTextInfo'   , colors.white, nil, nil)
Group.new('DiagnosticSignError'         , colors.superRed, nil, nil)
Group.new('DiagnosticSignWarn'          , colors.superYellow, nil, nil)
Group.new('DiagnosticSignHint'          , colors.superGreen, nil, nil)
Group.new('DiagnosticSignInfo'          , colors.superWhite, nil, nil)

Group.new('SagaNormal'                  , nil, colors.lightblack, nil)
Group.new('SagaBorder'                  , colors.green, nil, nil)

Group.new('BiscuitColor'                , colors.bisCuit, nil, nil)

Group.new('WhichkeyBorder'              , colors.white, colors.black, nil)
Group.new('WhichkeyFloat'               , colors.white, colors.black, nil)

Group.new('IndentBlanklineChar'         , colors.white, nil, nil)
Group.new('IndentBlanklineContextChar'  , colors.red, nil, nil)

Group.new('GitSignAdd'                  , colors.green, nil, nil)
Group.new('GitSignsChange'              , colors.lightblue, nil, nil)
Group.new('GitSignsChangedelete'        , colors.yellow, nil, nil)
Group.new('GitSignsDelete'              , colors.red, nil, nil)
Group.new('GitSignsUntracked'           , colors.cyan, nil, nil)
