local status, saga = pcall(require, 'lspsaga')
if not status then return end

vim.diagnostic.config({
	virtual_text = false
})

saga.setup({
  finder = { -- UI to show LSP methods search result
    max_height = 0.5,
    left_width = 0.3,
    rightwidth = 0.3,
    default = 'ref+imp', -- tyd, def, ref, imp
    methods = { -- alias of lsp methods 
      ['tyd'] = 'textDocument/typeDefinition',
    },
    layout = 'float', -- normal, float
    filter = {}, -- client_id : result
    silent = false,
    keys = {
      vsplit = '<C-v>',
      split = '<C-s>',
      shuttle = '[w',
      toggle_or_open = 'o',
      tabe = '<C-t>',
      close = '<C-c>',
    }
  },
  diagnostic = {
    show_code_action = true,
    jump_num_shortcut = true,
    max_width = 0.8,
    max_height = 0.6,
    text_hl_follow = true,
    border_follow = true,
    extend_relatedInformation = true,
    show_layout = 'float',
    max_show_width = 0.9,
    max_show_height = 0.6,
    diagnostic_only_current = false,
    keys = {
      exec_action = '<C-e>',
      quit = 'q',
      toggle_or_jump = '<CR>',
      quit_in_show = { 'q', '<ESC>' },
    },
  },
  definition = {
    width = 0.6,
    height = 0.5,
    keys = {
      edit = '<C-o>',
      vsplit = '<C-v>',
      split = '<C-s>',
      quit = 'q',
      close = '<C-c>',
    },
  },
  hover = {
    max_width = 0.9,
    max_height = 0.8,
    open_link = 'gx',
    open_cmd = '!chrome',
  },
  rename = {
    in_select = true,
    auto_save = false,
    project_max_width = 0.5,
    project_max_height = 0.5,
    keys = {
      quit = '<C-q>',
      exec = '<C-e>',
      select = 'x',
    },
  },
  callhierarchy = {
    layout = 'float',
    keys = {
      edit= 'e',
      vsplit = '<C-v>',
      split = '<C-s>',
      tabe = '<C-t>',
      quit = '<C-q>',
      shuttle = '[w',
    },
  },
  code_action = {
    num_shortcut = true,
    show_server_name = true,
    extend_gitsigns = false,
    keys = {
      quit = 'q',
      exec = '<CR>',
    },
  },
  lightbulb = {
    enable = false,
    sign = false,
    virtual_text = false,
    debounce = 10,
    sign_preority = 40,
  },
  symbol_in_winbar = {
    enable = true,
    -- separator = '',
    hide_keyword = true,
    show_file = true,
    folder_level = 1,
    color_mode = true,
    delay = 1000,
  },
  outline = {
    win_position = 'right',
    win_width = 30,
    auto_preview = true,
    detail = true,
    auto_close = true,
    close_after_jump = false,
    layout = 'normal',
    max_height = 0.5,
    max_width = 0.3,
    keys = {
      toggle_or_jump = 'o',
      quit = 'q',
      jump = 'e',
    },
  },
})
