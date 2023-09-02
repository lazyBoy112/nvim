local status, lspsaga = pcall(require, 'lspsaga')
if not status then return end

lspsaga.setup({
  ui = {
    expand = '',
    collapse = '',
    code_action = '💡',
    actionfix = ' ',
    lines = { '┗', '┣', '┃', '━', '┏' },
    kind = nil,
    imp_sign = '󰳛 ',
  },
  finder = {
    keys = {
      toggle_or_open = 'o',
      vsplit = 'v',
      split = 's',
      tabe = 't',
      tabnew = 'r',
      quit = 'q',
    },
  },
  symbol_in_winbar = {
    enable = true,
    separator = '  ',
    show_file = true,
    folder_level = 1,
    color_mode = true,
  },
  definition = {
    keys = {
      vsplit = '<C-v>',
      tabnew = '<C-n>',
      quit = 'q',
    },
  },
  diagnostic = {
    show_code_action = true,
    diagnostic_only_current = true,
    keys = {
      exec_action = 'o',
      quit = 'q',
      toggle_or_jump = '<CR>',
      quit_in_show = { 'q', '<ESC>' },
    },
  },
  hover = {
    open_link = 'gx',
    open_cmd = '!chrome',
  },
  lightbulb = {
    enable = false,
    sign = false,
    debounce = 10,
    sign_priority = 40,
    virtual_text = true,
    enable_in_insert = true,
  },
  scroll_preview = {
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
  },
  rename = {
    auto_save = false,
    keys = {
      quit = '<C-k>',
      exec = '<CR>',
      select = 'x',
    },
  },
  beacon = {
    enable = true,
    frequency = 7,
  },
})
