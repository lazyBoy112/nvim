local status, autopairs = pcall(require, 'nvim-autopairs')
if not status then return end

autopairs.setup ({
  disable_filetype = { 'TelescopePrompt', 'NvimTree' },
  enable_check_bracket_line = false,
  fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      manual_position = true,
      highlight = 'Search',
      highlight_grey='Comment'
  },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local handlers = require('nvim-autopairs.completion.handlers')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done({
  })
)

local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})

local ts_conds = require('nvim-autopairs.ts-conds')

-- ( |))
-- press % => %% only while inside a comment or string
npairs.add_rules({
  -- Rule("%", "%", "lua"),
--    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  -- Rule("$", "$", "lua")
  --   :with_pair(ts_conds.is_not_ts_node({'function'}))
})
