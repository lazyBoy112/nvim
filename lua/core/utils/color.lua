local M = {}

M.hex = ''

M.new = function(hex)
	M.hex = hex
end

function hex_to_rgb(hex)
	hex = hex:gsub('#', '')
	return tonumber(hex:sub(1,2), 16),
					tonumber(hex:sub(3,4), 16),
					tonumber(hex:sub(5,6), 16)
end

function rgb_to_hex(r, g, b)
	return string.format('#%02X%02X%02X', r, g, b)
end

function clamp(value)
	return math.max(0, math.min(value, 256))
end

M.lighten = function(hex, factor)
	local r, g, b = hex_to_rgb(hex)
	r = clamp(r + (255 - r) * factor)
	g = clamp(g + (255 - g) * factor)
	b = clamp(b + (255 - g) * factor)
	return rgb_to_hex(r, g, b)
end

M.darken = function(hex, factor)
	local r, g, b = hex_to_rgb(hex)
	r = clamp(r * (1 -factor))
	g = clamp(g * (1 -factor))
	b = clamp(b * (1 -factor))
	return rgb_to_hex(r, g, b)
end

return M
