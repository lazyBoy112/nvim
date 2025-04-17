local options = require 'assets.defaults.options'

local M = {}
M.setup = function(opts)
	options.setup(opts or {})
end

return M
