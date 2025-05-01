local opts = {
  left_mouse_command = "buffer %d",
  right_mouse_command = nil,
  middle_mouse_command = "bdelete! %d",
  right_sep = '', -- 
  left_sep = '▋', -- 
  hl_sep_active = '%#HlSepActive#',
  hl_sep_inactive = '%#HlSepInactive#',
  max_length = 10,
  left_sep_only = true
}

local cmds = {
  r = "right_mouse_command",
  l = "left_mouse_command",
  m = "middle_mouse_command",
}

local function handle_user_command(command, id)
  if not command then return end
  if type(command) == "function" then
    command(id)
  elseif type(command) == "string" then
    vim.schedule(function()
      vim.cmd(string.format(command, id))
    end)
  end
end

local function handle_click(id, _, button)
  local options = opts
  if id then handle_user_command(options[cmds[button]], id) end
  vim.schedule(function() vim.cmd.redrawtabline() end)
end

local function shorten_path(path)
  local parts = {}
  for part in string.gmatch(path, "[^/]+") do
    table.insert(parts, part)
  end

  for i = 1, #parts - 1 do
    parts[i] = string.sub(parts[i], 1, 1)
  end

  return table.concat(parts, "/")
end

local getCurrentIndexBuffer = function (current, bufs)
  for i, v in ipairs(bufs) do
    if v == current then return i end
  end
  return 0
end

_G.tabline_click = handle_click

-- Custom tabline
local mytabline = function ()
  local finalTabline = ''
  local bufsArray = vim.api.nvim_list_bufs() -- check loaded by nvim_buf_is_loaded
  local currentBuf = vim.api.nvim_get_current_buf()
  local maxTabs = math.floor(vim.o.columns / (opts.max_length + 1)) -- 16

  local bufTbl = {}
  local currentIndex = getCurrentIndexBuffer(currentBuf, bufsArray)
  local page = currentIndex % maxTabs == 0 and currentIndex / maxTabs - 1 or currentIndex / maxTabs

  local startIndex = currentIndex < maxTabs and 1 or page * maxTabs
  local endIndex = currentIndex < maxTabs and maxTabs or (page + 1) * maxTabs - 1
  endIndex = currentIndex + 1
  if endIndex - maxTabs  < 1 then
    startIndex = 1
    endIndex = maxTabs
  else
    startIndex = endIndex - maxTabs + 1
  end

  local filename = ''
  local tabTilte = ''
  local rightSep = ''
  local leftSep = ''
  local bufnr = 0

  for i=startIndex, endIndex do
    bufnr = bufsArray[i]
    print(i)
    print(bufnr)
    print(vim.inspect(bufsArray))
    if bufnr == nil then break end

    if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_get_option_value('buflisted', { buf=bufnr }) then
      filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':.')
      filename = shorten_path(filename)
      filename = string.sub(filename, 1, opts.max_length)

      if filename == '' then filename = '[No Name]' end
      filename = (bufnr == currentBuf and '' or ' ') .. filename .. ' '
      leftSep = opts.left_sep_only and currentBuf == bufnr and opts.left_sep or ''
      rightSep = opts.left_sep_only and '' or opts.right_sep

      if currentBuf == bufnr then
        tabTilte = opts.hl_sep_active .. leftSep ..
                    '%#TabLineSel#%'.. bufnr .. '@v:lua.tabline_click@' .. filename ..
                    opts.hl_sep_active .. rightSep .. '%X'
      else
        tabTilte = opts.hl_sep_inactive .. leftSep ..
                    '%#Tabline#%' .. bufnr .. '@v:lua.tabline_click@' .. filename ..
                    opts.hl_sep_inactive .. rightSep .. '%X'
      end

      finalTabline = finalTabline .. tabTilte
    end
  end

  finalTabline = finalTabline .. '%#TabLineFill#'
  if vim.fn.tabpagenr('$') > 1 then
    finalTabline = finalTabline .. '%#TabLine#%999XX'
  end
  -- print(finalTabline)
  return finalTabline

end

_G.my_tabline = mytabline

-- Set tabline
vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.my_tabline()"
