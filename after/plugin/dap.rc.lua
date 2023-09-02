local status, dap = pcall(require, 'dap')
if not status then return end


--[[ dap.adapters.python = {
  type = 'executable';
  command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
  args = { '-m', 'debugpy.adapter' };
} ]]
    -- dap.configurations.python = {
    --   {
    --     type = 'python';
    --     request = 'launch';
    --     name = "Launch file";
    --     program = "${file}";
    --     pythonPath = function()
    --       return '/usr/bin/python'
    --     end;
    --   },
    -- }
  -- - `${file}`: Active filename
  -- - `${fileBasename}`: The current file's basename
  -- - `${fileBasenameNoExtension}`: The current file's basename without extension
  -- - `${fileDirname}`: The current file's dirname
  -- - `${fileExtname}`: The current file's extension
  -- - `${relativeFile}`: The current file relative to |getcwd()|
  -- - `${relativeFileDirname}`: The current file's dirname relative to |getcwd()|
  -- - `${workspaceFolder}`: The current working directory of Neovim
  -- - `${workspaceFolderBasename}`: The name of the folder opened in Neovim
  -- - `${command:pickProcess}`: Open dialog to pick process using |vim.ui.select|
  -- - `${env:Name}`: Environment variable named `Name`, for example: `${env:HOME}`.
dap.set_log_level('TRACE')
