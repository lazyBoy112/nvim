local status, whichkey = pcall(require, 'which-key')
if not status then return end

whichkey.setup({
  icons = {
    separator = '󰁕',
    group = '+',
  },
  window = {
    border = 'single', -- none, single, double, shadow
    winblend = 0,
  },
  popup_mappings = {
    scroll_down = '<c-f>',
    scroll_up = '<c-b>',
  },
})

local tables = {
  -- ['...'] = { name = "...", f = {"command", "name"},}
  ['<leader>b'] = {
    name = '+basic config',
    c = 'Configuration',
    n = 'New_tab',
    h = 'Toggle highlight search',
    i = 'Toggle info of block',
  },
  ['<leader>c'] = {
    name = '+Comment',
    b = 'block',
    l = 'line',
  },
  ['<leader>d'] = {
    name = '+Debug',
    t = 'toggle breakpoint',
    c = 'close',
  },
  ['<leader>e'] = { name = 'File explorer' },
  ['<leader>l'] = {
    name = '+Lsp',
    a = 'Code action',
    d = 'Definication',
    f = 'Finder',
    o = 'Outline',
    r = 'Rename',
  },
  ['<leader>s'] = {
    name = '+search',
    b = 'buffer',
    e = 'diagostics',
    f = 'file',
    h = 'help',
    k = 'keymap',
    o = 'recent files',
    w = 'word',
  },
  ['<leader>t'] = {
    name = '+Terminal',
    f = 'Float',
    h = 'Horizontal',
    v = 'Vertical',
    ['1'] = {'<cmd>lua require("toggleterm").toggle(1)<cr>', 'terminal 1'},
    ['2'] = {'<cmd>lua require("toggleterm").toggle(2)<cr>', 'terminal 2'},
    ['3'] = {'<cmd>lua require("toggleterm").toggle(1)<cr>', 'terminal 3'},
  },
  ['<leader>w'] = {
    name = '+window',
    h = 'horizontal split',
    v = 'vertical split',
  },
}

whichkey.register(tables)
