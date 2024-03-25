local status, _ = pcall(require, 'nui.popup')
if not status then return end

local popup = require('nui.popup')
local event = require('nui.utils.autocmd').event
local basic_popup = {
  enter = true,
  focusable = true,
  border = {
    style = 'rounded',
    text = {
      top = " I am top title ",
      top_align = "center",
    },
  },
  position = '50%',
  size = {
    width = '80%',
    height = '70%',
  },
}

local M = {}
M.options = {}
function M.create()
  local active = M.options.active
  local n = M.options.n_term
  if n > 0 then
    if active then
      M.terms[active]:hide()
    end
    M.options.n_term = n + 1
    active = M.options.n_term
  else
    active = 1
    M.options.n_term = 1
  end
  M.options.active = active
  M.terms[active] = popup(basic_popup)
  M.terms[active]:on(event.BufLeave, function()
    M.terms[active]:unmount()
  end)
  M.terms[active]:show()
  vim.api.nvim_buf_call(M.terms[active].bufnr,
    function()
      vim.cmd[[terminal]]
      vim.api.nvim_input('ipwsh<cr>clear<cr>')
    end)
end

function M.next()
  local active = M.options.active
  local n = M.options.n_term
  local last_active = M.options.last_active
  if n < 1 then
    return
  end
  if active then
    M.terms[active]:hide()
    if active == n then
      active = 1
    else
      active = active + 1
    end
  else
    if not last_active then
      active = 1
    else
      active = last_active
    end
  end
  M.options.active = active
  M.options.last_active = nil
  M.terms[active]:show()
end

function M.prev()
  local active = M.options.active
  local n = M.options.n_term
  local last_active = M.options.last_active
  if n < 1 then
    return
  end
  if active then
    M.terms[active]:hide()
    if active == 1 then
      active = n
    else
      active = active - 1
    end
  else
    if not last_active then
      active = 1
    else
      active = last_active
    end
  end
  M.options.active = active
  M.options.last_active = nil
  M.terms[active]:show()
end

function M.toggle()
  local n = M.options.n_term
  local active = M.options.active
  local last_active = M.options.last_active
  if n < 1 then
    return
  end
  if active then 
    M.options.last_active = active
    M.options.active = nil
    M.terms[active]:hide()
  else
    M.options.active = last_active
    M.options.last_active = nil
    M.terms[M.options.active]:show()
    vim.api.nvim_input('i')
  end
end

function M.close()
  local n = M.options.n_term
  local active = M.options.active
  local last_active = M.options.last_active
  if n < 1 then
    return
  end
  if active then
    M.terms[active]:unmount()
    for i=active,n,1 do
      M.terms[i] = M.terms[i + 1]
    end
    if active == n then
      if active - 1 > 0 then
        active = active - 1
      else
        M.options.active = nil
        M.options.last_active = nil
        M.options.n_term = 0
        M.terms[1] = nil
        return
      end
    end
    M.options.n_term = n - 1
    M.options.active = active
    M.terms[n] = nil
    M.terms[active]:show()
  end
end

function M.closeAll()
  local n = M.options.n_term
  M.options.active = nil
  M.options.last_active = nil
  for i=n,1,-1 do
    M.terms[i]:unmount()
    M.terms[i] = nil
  end
  M.options.n_term = 0
end

function M.get()
  print('get:l_ac', M.options.last_active)
  print('get:ac', M.options.active)
  print('get:n', M.options.n_term)
end

function M.setup()
  M.options.n_term = 0
  M.terms = {}
  M.options.active = nil
  M.options.last_active = nil
  vim.keymap.set({'n', 't', 'i'}, '<A-n>', function () M.create() end)
  vim.keymap.set({'n', 't', 'i'}, '<A-]>', function () M.next() end)
  vim.keymap.set({'n', 't', 'i'}, '<A-[>', function () M.prev() end)
  vim.keymap.set({'n', 't', 'i'}, '<A-t>', function () M.toggle() end)
  vim.keymap.set({'n', 't', 'i'}, '<A-q>', function () M.close() end)
  vim.keymap.set({'n', 't', 'i'}, '<A-a>', function () M.closeAll() end)
  vim.keymap.set({'n', 't', 'i'}, '<A-g>', function () M.get() end)
end
return M
