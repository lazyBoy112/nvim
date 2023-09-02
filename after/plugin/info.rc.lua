local status, biscuits = pcall(require, 'nvim-biscuits')
if not status then return end

biscuits.setup({
  default_config = {
    max_length = 25,
    min_distance = 5,
    prefix_string = " 󰜴 "
  },
  language_config = {
    html = {
      prefix_string = " 🌐 "
    },
    javascript = {
      prefix_string = " ✨ ",
      max_length = 80
    },
    python = {
      --disabled = true
    }
  },
  toggle_keybind = "<leader>bi",
  show_on_start = false,
})
