local default = require 'assets.defaults.theme'

local M = {}


-- Setup highlight group
-- @param opts table example: { ['Normal'] = {bg = 'none'}}
M.setup = function(opts)
	local groups = vim.tbl_deep_extend('force',default.groups, opts or {}) or {}
	for group, args in pairs(groups) do
		--print(group)
		--print(args)
		vim.api.nvim_set_hl(0, group, args)
	end
end

return M
