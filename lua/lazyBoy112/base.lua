local M = {}

M.options = {
  -- Ultilies
  swapfile = false,
  encoding = 'utf-8',
  fileencoding = 'utf-8',
  smarttab = true,
  modifiable = true,

  foldmethod = 'expr', -- manual, indent, expr, marker, syntax, diff
  foldexpr= 'v:lua.vim.treesitter.foldexpr()',
  foldcolumn = '1',
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true,
  foldtext = 'v:lua.foldDisplay()',
  tabline = '%!v:lua.lazy_bufferline()',
  showtabline = 2,

  autowrite = true, -- Enable auto write
  clipboard = "unnamedplus", -- Sync with system clipboard
  completeopt = "menu,menuone,noselect",
  conceallevel = 3, -- Hide * markup for bold and italic
  confirm = true, -- Confirm to save changes before exiting modified buffer
  cursorline = true, -- Enable highlighting of the current line
  expandtab = true, -- Use spaces instead of tabs
  formatoptions = "tcqj", -- tcqj, jcroqlnt
  -- grepformat = "%f:%l:%c:%m",
  -- grepprg = "rg --vimgrep",
  ignorecase = true, -- Ignore case
  inccommand = "nosplit", -- preview incremental substitute
  laststatus = 3, -- global statusline
  list = true, -- Show some invisible characters (tabs...
  mouse = "a", -- Enable mouse mode
  number = true, -- Print line number
  pumblend = 10, -- Popup blend
  pumheight = 10, -- Maximum number of entries in a popup
  relativenumber = false, -- Relative line numbers
  cmdheight = 0,
  numberwidth = 1,
  scrolloff = 4, -- Lines of context
  sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" },
  shiftround = true, -- Round indent
  shiftwidth = 2, -- Size of an indent
  showmode = false, -- Dont show mode since we have a statusline
  sidescrolloff = 8, -- Columns of context
  signcolumn = "auto", -- Always show the signcolumn, otherwise it would shift the text each time
  smartcase = true, -- Don't ignore case with capitals
  smartindent = true, -- Insert indents automatically
  spelllang = { "en" },
  splitbelow = true, -- Put new windows below current
  splitkeep = "screen",
  splitright = true, -- Put new windows right of current
  tabstop = 2, -- Number of spaces tabs count for
  termguicolors = true, -- True color support
  timeoutlen = 300,
  undofile = true,
  undolevels = 10000,
  updatetime = 200, -- Save swap file and trigger CursorHold
  virtualedit = "block", -- Allow cursor to move where there is no text in visual block mode
  wildmode = "longest:full,full", -- Command-line completion mode
  winminwidth = 5, -- Minimum window width
  wrap = false, -- Disable line wrap
  fillchars = {
    foldopen = "",
    foldclose = "",
    -- fold = "┋",
    fold = " ",
    foldsep = "┋", -- ┊, │
    -- foldsep = " ", -- ┊, │
    diff = "╱",
    eob = " ",
  },
  listchars = {
    eol  = '↵', -- ⤶↵
    tab = '  ', -- <->
    space = ' ',
    multispace = ' ', -- ---+
    lead = ' ',
    leadmultispace = ' ', -- (-)
    trail = ' ',
    -- extends = '󰞘', -- , , , , 󰁔, 󰅂, 󰍟, , 󰞔, 󰞘. 󰘠
    -- precedes = '󰞗', -- , , , , 󰁍, 󰅁, 󰍞, , 󰞓, 󰞗, 󰘟
    -- conceal = '1', -- conceal text
    -- nbsp = '&', -- non-breackable space
  }, -- ⤶↵

}

M.globalVar = {
  mapleader = ' ',
}

M.mColor = {
  -- none = 'none',

  black = '#001618',
  l_black = '#363062',

  red = '#bf616a',
  l_red = '#e06c75',

  green = '#a3be8c',
  l_green = '#b5bd68',

  yellow = '#ebcb8b',
  l_yellow = '#f0c674', -- 

  blue = '#81a2be',
  l_blue = '#88c0d0',

  magenta = '#b48ead',
  l_magenta = '#dc8cc3',

  cyan = '#3f868f',
  l_cyan = '#56b6c2',

  white = '#8fa1b3',
  l_white = '#c0c5ce',
}

M.icon = {
  cmp = {
    Array         = " ",
    Boolean       = "󰨙 ",
    Class         = " ",
    Codeium       = "󰘦 ",
    Color         = " ",
    Control       = " ",
    Collapsed     = " ",
    Constant      = "󰏿 ",
    Constructor   = " ",
    Copilot       = " ",
    Enum          = " ",
    EnumMember    = " ",
    Event         = " ",
    Field         = " ",
    File          = " ",
    Folder        = " ",
    Function      = "󰊕 ",
    Interface     = " ",
    Key           = " ",
    Keyword       = " ",
    Method        = "󰊕 ",
    Module        = " ",
    Namespace     = "󰦮 ",
    Null          = " ",
    Number        = "󰎠 ",
    Object        = " ",
    Operator      = " ",
    Package       = " ",
    Property      = " ",
    Reference     = " ",
    Snippet       = " ",
    String        = " ",
    Struct        = "󰆼 ",
    TabNine       = "󰏚 ",
    Text          = " ",
    TypeParameter = " ",
    Unit          = " ",
    Value         = " ",
    Variable      = "󰀫 ",
  },
  diagnostics = {
    Error = " ",
    Warn  = " ",
    Hint  = " ",
    Info  = " ",
  },

}

M.plugins = {
  { 'neovim/nvim-lspconfig' },
  { 'norcalli/nvim-colorizer.lua' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { "L3MON4D3/LuaSnip" },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'nvimdev/lspsaga.nvim', dependecies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'}, event='LspAttach',},
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim', tag='0.1.4', dependecies= { 'nvim-lua/plenary.nvim' } },
  { 'nvim-telescope/telescope-file-browser.nvim', dependecies={ 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' } },
  { 'nvim-tree/nvim-tree.lua' },
  { 'windwp/nvim-autopairs', event='InsertEnter', opts={} },
  { 'numToStr/Comment.nvim', lazy=false },
  { 'lewis6991/gitsigns.nvim'},
  -- lazy.nvim
  -- {
  --   'folke/noice.nvim',
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --   -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --   'MunifTanjim/nui.nvim',
  --   }
  -- },
  { 'MunifTanjim/nui.nvim' },
}


return M
