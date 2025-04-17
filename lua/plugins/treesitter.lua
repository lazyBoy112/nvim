return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function ()
    local configs = require('nvim-treesitter.configs')
    configs.setup({
      ensure_installed = { 'lua' },
      sync_install = true,
      hightlight = { enable = true },
      indent = { enable = true },
    })
  end
}
