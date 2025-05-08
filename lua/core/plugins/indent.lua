--[[ global key ]]
-- vim.g.lazyboy_animate_indent = true

---@class indent
local M = {}
local defaults = {
  enable = true,
  animate = {
    enable = true,
  },
  filter = function(buf)
    return vim.g.lazyboy_indent ~= false and vim.b[buf].lazyboy_indent ~= false and vim.bo[buf].buftype == ''
  end,
}

---@class indent.setup
---@field opts table<string, string>
---@desc 'setup indent'
function M.setup(opts)
  local config = vim.tbl_deep_extend('force', defaults, opts or {}) or {}

  vim.g.lazyboy_animate_indent = config.animate.enable

  vim.api.nvim_set_decoration_provider(ns, {
    on_win = function(_, win, buf, top, bottom)
      if config.enable and config.filter(buf) then
        M.on_win(win, buf, top + 1, bottom + 1)
      end
    end,
  })
end

return M
