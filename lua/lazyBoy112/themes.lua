local background  = '#151020' -- #343434
local none        = 'none'

local white       = '#cccccc'
local black       = '#000000'

local red         = '#e65f76'
local darkred     = '#ff54d5'

local blue        = '#92b6f0'
local darkblue    = '#3B3B8B'

local yellow      = '#fff49b' -- #fae5c2
local darkyellow  = '#d24726'

local green       = '#90EE90'
local darkgreen   = '#5bc8af'

local purple      = '#d1b9ff'
local darkpurple  = '#a14ebf'

local gray        = '#999999'
local darkgray    = '#676087'

local cyan        = '#20B2AA' --#8fdffd
local darkcyan    = '#084F5F'

return {
	['SignColumn'] = { bg=background },
	['Normal'] = { fg=white, bg=background },
	['Visual'] = { reverse=true, bold=true },
	['Comment'] = { fg=gray, bg=none, italic=true },
	['CursorLine'] = { fg=none, bg=darkcyan },
	['CursorLineNr'] = { fg=blue, bg=darkcyan },
	['LineNr'] = { fg=darkgray, bg=background },
}
