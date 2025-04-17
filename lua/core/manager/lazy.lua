-- ~/nvim/lua/slydragonn/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, 'lazy')
if not status then
	print('lazy not found')
	return
end

lazy.setup({
	spec = {
		{ import = "plugins" },
	},
	--install = { colorscheme = 'habamax' },
	--checker = { enabled = true },
})
