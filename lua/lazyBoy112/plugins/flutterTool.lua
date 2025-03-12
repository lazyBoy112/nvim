local status, tools = pcall(require, 'flutter-tools')
if not status then return end

tools.setup({
  widget_guides = { enabled = true },
  lsp = {
    settings = {
      showtodos = true,
      completefunctioncalls = true,
      analysisexcludedfolders = {
        vim.fn.expand("$HOME/.pub-cache"),
      },
      renamefileswithclasses = "prompt",
      updateimportsonrename = true,
      enablesnippets = false,
    },
  },
})
