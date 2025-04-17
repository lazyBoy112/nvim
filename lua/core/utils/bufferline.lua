local M = {}

function M.render()
  local buffers = vim.api.nvim_list_bufs()
  local current = vim.api.nvim_get_current_buf()

  local tab_line = ""
  local underline = ""

  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_get_option_value("buflisted", {buf=buf}) then
      local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
      name = name == "" and "[No Name]" or name

      local display = " " .. name .. " "
      local len = vim.fn.strdisplaywidth(display)

      if buf == current then
        tab_line = tab_line .. "%#TabLineSel#" .. display
        underline = underline .. "%#TabLineUnderline#" .. string.rep("─", len)
      else
        tab_line = tab_line .. "%#TabLine#" .. display
        underline = underline .. "%#TabLineFill#" .. string.rep(" ", len)
      end
    end
  end

  -- Combine underline + tab line
  return tab_line..'%#TabLineFill#'
end

function M.setup()
  vim.o.showtabline = 2
  vim.o.tabline = "%!v:lua.require'core.utils.bufferline'.render()"

end

return M

