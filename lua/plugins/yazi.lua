return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  dependencies = {
    'folke/snacks.nvim'
  },
  init = function ()
    vim.g.loaded_netrwPlugin = 1
  end,
  opts = {
    open_for_directories = true,
    floating_window_scaling_factor = 1,
    keymaps = {
      show_elp = '<F1>',
      open_file_in_vertical_split = '<c-v>',
      open_file_in_horizontal_split = '<c-x>',
      open_file_in_tab = '<c-t>',
      grep_in_directory = '<c-s>',
      replace_in_directory = '<c-g>',
      cycle_open_buffers = '<tab>',
      copy_relative_path_to_selected_files = '<c-y>',
      send_to_quickfix_list = '<c-q>',
      change_working_directory = '<c-\\>'
    },
    yazi_floating_window_border = 'rounded',
  }
}
