local opts = {
  left_mouse_command = "buffer %d",
  right_mouse_command = "bdelete! %d",
  middle_mouse_command = nil,
  right_sep = '', -- 
  left_sep = '', -- 
  max_length = 10
}

_G.___bufferline_private = _G.___bufferline_private or {} -- to guard against reloads

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

_G.___bufferline_private.handle_click = handle_click

local function is_valid(buf_num)
  if not buf_num or buf_num < 1 then return false end
  local exists = vim.api.nvim_buf_is_valid(buf_num)
  return vim.bo[buf_num].buflisted and exists
end


function _G.lazy_bufferline()
  local line = ''
  local buf_nums = vim.tbl_filter(is_valid, vim.api.nvim_list_bufs())
    for _, id in pairs(buf_nums) do
        local file = vim.api.nvim_buf_get_name(id)
        local tab_sep_active = '%#TabLineSepActive#% '
        local tab_sep_inactive = '%#TabLineSepInactive#% '
        local path = vim.fn.pathshorten(vim.fn.fnamemodify(file, ':p:~:t'))
        local s_path = path
        if string.len(s_path) > opts.max_length then
          s_path = string.sub(path, 1, opts.max_length)
        end
        if vim.fn.bufnr() == id then
          line = line .. tab_sep_active .. opts.left_sep
                      .. '%' .. id ..'@v:lua.___bufferline_private.handle_click@'
                      .. '%#TabLineSel#% ' .. s_path
                      .. tab_sep_active ..opts.right_sep
        else 
          line = line .. tab_sep_inactive .. opts.left_sep
                      .. '%' .. id ..'@v:lua.___bufferline_private.handle_click@'
                      .. '%#TabLine#% ' .. s_path
                      .. tab_sep_inactive ..opts.right_sep
        end

    end
    line = line .. '%#TabLineFill#%='
    if vim.fn.tabpagenr('$') > 1 then
        line = line .. '%#TabLine#%999XX'
    end
    line = line .. '%#TabLineIcon#% ' .. '󰒲 '
    return line
end
