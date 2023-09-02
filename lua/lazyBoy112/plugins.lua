local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
if (not status) then return end

lazy.setup({
-- Lsp and auto complete
  { 'neovim/nvim-lspconfig' },
  { 'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    event = 'LspAttach'
  },
  { 'hrsh7th/nvim-cmp',
    event = 'LspAttach'
  },
  { 'hrsh7th/cmp-nvim-lsp',
    event = 'LspAttach'
  },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'L3MON4D3/LuaSnip', version = "2.*", build = "make install_jsregexp" },
-- Utils
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-tree/nvim-tree.lua' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },
  { 'norcalli/nvim-colorizer.lua' },
  { 'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    tag = '0.1.2'
  },
  { 'tjdevries/colorbuddy.nvim' },
  { 'rebelot/heirline.nvim' },
  { 'code-biscuits/nvim-biscuits',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
    }
  },
  { "MunifTanjim/nui.nvim" },
  { 'folke/noice.nvim',
    --event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  { 'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  { 'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
    }
  },
  { 'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  { 'lukas-reineke/indent-blankline.nvim' },
  { 'lewis6991/gitsigns.nvim' },
  { 'akinsho/toggleterm.nvim', version = "*"},
  { 'mfussenegger/nvim-dap' },
  { 'rcarriga/nvim-dap-ui' },
})
