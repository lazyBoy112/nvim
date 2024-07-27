local M = {}
_G.lazyBoyfold = {}
local   l_char = '┣' -- ┣  
local char = '━'  --  ━ , ⦁
local r_char = '┫' --  ┫

--- custom foldtext
function M.lazyBoy_foldtext()
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

local function fold_sign_handler(minwid, clicks, button, mods)
  if button ~= 'l' then
    return
  end
  local mousepos = vim.fn.getmousepos()
  vim.api.nvim_set_current_win(mousepos.winid)
  vim.api.nvim_win_set_cursor(0, {mousepos.line, 0})
  -- local text = vim.fn.screenstring(args.mousepos.screenrow, args.mousepos.screencol)
  local text = vim.fn.screenstring(mousepos.screenrow, mousepos.screencol)
  if text == '' or text == '' then
    vim.cmd 'norm! za'
  end
end

_G.lazyBoyfold.fold_sign_handler = fold_sign_handler

local fold_sign = function()
  local level = vim.fn.foldlevel(vim.v.lnum)
  local pre_level = vim.fn.foldlevel((vim.v.lnum - 1) >= 1 and vim.v.lnum - 1 or 1)
  local closed = vim.fn.foldclosed(vim.v.lnum)

  local text = ''
  local hl = '%#lazyBoyFoldSign#'
  local hl_border = '%#lazyBoyFoldBorder#'
  local click_event = "%@v:lua.lazyBoyfold.fold_sign_handler@"
  if closed ~= -1 and closed == vim.v.lnum then
    return hl..''..hl_border..'┆'
    -- text = hl..' '
  end
  if level > pre_level then
    return hl..''..hl_border..'┆'
    -- text = hl..' '
  end
  return hl..click_event..' '..hl_border..'┆'
end

local fold_number = function()
  local cur_line = vim.api.nvim_win_get_cursor(0)[1]

  local num_line = tostring(#tostring(vim.fn.line('$')))
  local hl = '%#lazyBoyFoldNumber#'
  local hl_sel = '%#lazyBoyFoldSelNumber#'

  if vim.v.lnum == cur_line then
    return hl_sel..string.format('%'..num_line..'d', vim.v.lnum)
  end
  return hl..string.format('%'..num_line..'d', vim.v.lnum)
end

function M.lazyBoy_foldbar() 
  return table.concat({
    '%s',
    fold_number(),
    fold_sign(),
  })
end

return M
