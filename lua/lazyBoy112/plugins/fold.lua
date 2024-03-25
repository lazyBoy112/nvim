local M = {}
local   l_char = '┣' -- ┣  
local char = '━'  --  ━ , ⦁
local r_char = '┫' --  ┫
  --
function _G.foldDisplay()
  local line = vim.fn.getline(vim.v.foldstart)
  local nlineFolded = vim.v.foldend - vim.v.foldstart
  local nlineStr = tostring(nlineFolded)..' lines'
  local width = vim.api.nvim_win_get_width(0)
  local eline = vim.fn.getline(vim.v.foldend)
  local extras = ''
  if not eline then
    extras = ''
  elseif eline == '}' then
    extras = '...}'
  elseif eline == ']' then
    extras = '...]'
  elseif eline == ')' then
    extras = '...)'
  elseif eline == 'end' then
    extras = '...end'
  end
  local ne = 3
  local nr = width - string.len(line) - 14 - ne - string.len(extras) - string.len(nlineStr)

  return '+--- '..line..extras
          ..l_char..string.rep(char, nr)..r_char
          ..nlineStr..string.rep(char, ne)
  -- return '+-- '..line..extras..tostring(width)
end
