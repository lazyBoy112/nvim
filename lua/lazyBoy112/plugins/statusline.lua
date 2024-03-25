local status,_ = pcall(require, 'nvim-web-devicons')
if not status then return end
local modes = {
  n = "N",
  no = "N?",
  nov = "N?",
  noV = "N?",
  ["no\22"] = "N?",
  niI = "Ni",
  niR = "Nr",
  niV = "Nv",
  nt = "Nt",
  v = "V",
  vs = "Vs",
  V = "V_",
  Vs = "Vs",
  ["\22"] = "^V",
  ["\22s"] = "^V",
  s = "S",
  S = "S_",
  ["\19"] = "^S",
  ['i'] = "I",
  ['ic'] = "Ic",
  ['ix'] = "Ix",
  R = "R",
  Rc = "Rc",
  Rx = "Rx",
  Rv = "Rv",
  Rvc = "Rv",
  Rvx = "Rv",
  c = "C",
  cv = "Ex",
  r = "...",
  rm = "M",
  ["r?"] = "?",
  ["!"] = "!",
  t = "T",
  }

local normal_com  = '%#STnormalCom#'
local width_percent_below = function(n, thresh) return n / vim.o.columns <= thresh
end


local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  local str = "%#STmode"
  local mode_color = ''
  if current_mode == 'n' or current_mode == 'no' or current_mode == 'nov' or current_mode == 'noV' or current_mode == 'no\22' or current_mode == 'niI' or current_mode == 'niR' or current_mode == 'niV' or current_mode == 'nt' then
    mode_color = str..'Normal#'
  elseif current_mode == 'v' or current_mode == 'vs' or current_mode == 'V' or current_mode == 'Vs' or current_mode == '\22' or current_mode == '\22s' then
    mode_color = str..'Visual#'
  elseif current_mode == 's' or current_mode == 'S' or current_mode == '\19' then
    mode_color = str..'Select#'
  elseif current_mode == 'i' or current_mode == 'ic' or current_mode == 'ix' then
    mode_color = str..'Insert#'
  elseif current_mode == 'R' or current_mode == 'Rc' or current_mode == 'Rx' or current_mode == 'Rv' or current_mode == 'Rvc' or current_mode == 'Rvx' then
    mode_color = str..'Replace#'
  elseif current_mode == 'c' or current_mode == 'cv' then
    mode_color = str..'Command#'
  elseif current_mode == 't' then
    mode_color = str..'Terminal#'
  end
  if vim.bo.filetype == "alpha" or vim.bo.filetype == 'TelescopePrompt' or vim.bo.filetype == 'netrw' then
    return ''
  end
  return mode_color..'%2('..modes[current_mode]:upper()..'%)'
end

local function sepR()
  local current_mode = vim.api.nvim_get_mode().mode
  local str = "%#STsepR"
  local mode_color = ''
  if current_mode == 'n' or current_mode == 'no' or current_mode == 'nov' or current_mode == 'noV' or current_mode == 'no\22' or current_mode == 'niI' or current_mode == 'niR' or current_mode == 'niV' or current_mode == 'nt' then
    mode_color = str..'Normal#'
  elseif current_mode == 'v' or current_mode == 'vs' or current_mode == 'V' or current_mode == 'Vs' or current_mode == '\22' or current_mode == '\22s' then
    mode_color = str..'Visual#'
  elseif current_mode == 's' or current_mode == 'S' or current_mode == '\19' then
    mode_color = str..'Select#'
  elseif current_mode == 'i' or current_mode == 'ic' or current_mode == 'ix' then
    mode_color = str..'Insert#'
  elseif current_mode == 'R' or current_mode == 'Rc' or current_mode == 'Rx' or current_mode == 'Rv' or current_mode == 'Rvc' or current_mode == 'Rvx' then
    mode_color = str..'Replace#'
  elseif current_mode == 'c' or current_mode == 'cv' then
    mode_color = str..'Command#'
  elseif current_mode == 't' then
    mode_color = str..'Terminal#'
  end
  if vim.bo.filetype == "alpha" or vim.bo.filetype == 'TelescopePrompt' then
    return ''
  end
  return mode_color..' '
end

local git = function()
  if not vim.b.gitsigns_head and not vim.b.gitsigns_status_dict then
    return ''
  end
  local status_dict = vim.b.gitsigns_status_dict
  local has_changes = status_dict.added ~= 0 or status_dict.removed ~=0 or status_dict.changed ~= 0

  local branch = status_dict.head
  local c_add = status_dict.added or 0
  local s_add = ''
  if c_add > 0 then
    s_add = '+'..c_add
  end

  local c_remove = status_dict.removed or 0
  local s_remove = ''
  if c_remove > 0 then
    s_remove = '-'..c_remove
  end

  local c_change = status_dict.changed or 0
  local s_change = ''
  if c_change > 0 then
    s_change = '~'..c_change
  end
  local count = ''
  if has_changes then
    count = '('..'%#STgitAdd#'..s_add..'%#STgitRemove#'..s_remove..'%#STgitChange#'..s_change..'%#STgitBranch#'..')'
  end

  local str = '%#STgitBranch#'..' '..branch..count
  local cstr = str
  if not width_percent_below(#str, 0.7)  then
    cstr = '%#STgitBranch#'..' '
  end
  -- if not width_percent_below(#str, 1.5) then
  --   return ''
  -- end

  return cstr
end

local fileBlock = function ()
  local filename = vim.fn.fnamemodify(vim.fn.expand '%', ':.')
  if filename == '' then return '[No name]' end
  if not width_percent_below(#filename, 0.25) then
    filename = vim.fn.pathshorten(filename)
  end
  if not width_percent_below(#filename, 0.30) then
    filename = vim.fn.fnamemodify(vim.fn.expand '%', ':t')
  end
  local extension = vim.fn.fnamemodify(filename, ':e')
  local icon, icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, {default=true})
  local modified = ''
  if vim.bo.modified then
    modified = '[+]'
  end
  vim.api.nvim_set_hl(0, 'STicon', {fg=icon_color})
  vim.api.nvim_set_hl(0, 'STflag', {fg='#d24726'})
  return normal_com..'%#STicon#'..icon..' '..filename..'%#STflag#'..modified
end

local function diagnostic()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#LspSignError#E" .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspSignWarn#W"..count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspSignHint#H" .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspSignInfo#I" .. count["info"]
  end

  local str =  errors .. warnings .. hints .. info .. "%#Normal#"
  if not width_percent_below(#str, 0.55) then
    return ''
  end
  return str
end

local lsp = function ()
  if next(vim.lsp.buf_get_clients()) == nil then
    return ''
  end
  local names = {}
  for _, server in pairs(vim.lsp.get_active_clients()) do
    table.insert(names, server.name)
  end
  if not width_percent_below(#table.concat(names, ' '), 0.1) then
    return '%#STlsp# '
  end
  return '%#STlsp# '..'[ '..table.concat(names, ' ')..' ]'
end

local searchCount = function ()
  if vim.v.hlsearch == 0 then 
    return ''
  end
  local ok, search = pcall(vim.fn.searchcount)
  if ok then 
    return '%#STsearch#'..string.format('[%d/%d]', search.current, math.min(search.total, search.maxcount))
  end
end

local function filetype()
  local ft = vim.bo.filetype
  if ft == "alpha" or ft == 'TelescopePrompt' then
    return ""
  end
  if not width_percent_below(#ft, 0.04) then
    return ''
  end
  return ' %#STfiletype#'..ft..' '
end

local sepL = '%#STsepL#'

local function lineinfo()
  if vim.bo.filetype == "alpha" or vim.bo.filetype == 'TelescopePrompt' then
    return ""
  end
  local sign = '%#STline#'
  local ruler = ' %P %l:%c '
  if not width_percent_below(#ruler, 0.22) then
    return sign..'%l:%c'
  end
  return sign..ruler
end

Statusline = {}

Statusline.active = function()
  return table.concat {
    mode(),
    sepR(),
    git(),
    "%#Normal# ",
    fileBlock(),
    -- filepath(),
    -- filename(),
    "%#Normal#",
    diagnostic(),
    "%=%#StatusLineExtra#",
    lsp(),
    searchCount(),
    filetype(),
    sepL,
    lineinfo(),
  }
end

function Statusline.inactive()
  return " %F"
end

function Statusline.short()
  return "%#StatusLineNC#"
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)

