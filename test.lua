local data = {
  term = {},
  active = nil,
  startId = nil,
  endId = nil,
  lastactive = nil,
  max_term = 4,
}
local opts_key = {noremap=true, silent=true}

local popup = require('nui.popup')
local event = require('nui.utils.autocmd').event
local cfg_popup = function(id)
  return {
    enter = true,
    focusable = true,
    border = {
      style = 'rounded',
      text = {
        top = "  : term #"..tostring(id),
        top_align = "center",
      },
    },
    position = '50%',
    size = {
      width = '80%',
      height = '70%',
    },
  }
end



-- local p = popup(basic_popup)
-- p:mount()
-- vim.api.nvim_buf_call(p.bufnr,
--   function()
--     vim.cmd[[terminal]]
--     vim.api.nvim_input('ipwsh<cr>clear<cr>')
--     -- vim.api.nvim_input()
--   end)
-- p:on(event.BufLeave, function()
--   p:unmount()
-- end)
-- p:hide()
-- vim.keymap.set('n', 'tt', function ()
--   print('show')
--   p:show()
-- end, {noremap=true})
-- p:map('t', '<A-t>', function ()
--   print('hide')
--   p:hide()
-- end, {noremap=true})
vim.keymap.set('n', 't1', function() print('hello') end, {noremap=true})




local setup = function()
  vim.keymap.set({ 'n', 'i', 't' }, '<A-n>', function()
  end, opts_key)
  vim.keymap.set({ 'n', 'i', 't' }, '<A-p>', function()
  end, opts_key)
  vim.keymap.set({ 'n', 'i', 't' }, '<A-t>', function()
  end, opts_key)
  vim.keymap.set({ 'n', 'i', 't' }, '<A-q>', function()
  end, opts_key)
  vim.keymap.set({ 'n', 'i', 't' }, '<A-c>', function()
    if data.endId == nil then
      data.term[1] = popup(cfg_popup(1))
      data.endId = 1
      data.startId = 1
      data.active = 1
      data.lastactive = 1
    else
    end
  end, opts_key)
end
