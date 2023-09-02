local keymap = vim.keymap.set
local opts = {silent=true, noremap=true}


keymap('', 'x', '"_x')
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

keymap('n', 'dw', 'evbd')
keymap('n', '<C-a>', 'ggVG')
keymap('n', '<leader>bh', '<cmd>set nohlsearch!<cr>', opts)

-- Tab
keymap('n', '<leader>bn', '<cmd>tabedit<cr>', opts)
keymap('n', '<leader>bc', ':e $MYVIMRC | :cd %:p:h<cr>', opts)
keymap('n', '<tab>', '<cmd>bnext<cr>', opts)
keymap('n', '<S-tab>', '<cmd>bprevious<cr>', opts)

-- Window
keymap('n', '<leader>wh', '<cmd>split<cr>', opts)
keymap('n', '<leader>wv', '<cmd>vsplit<cr>', opts)

keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')

keymap('n', '<C-left>', '<C-w><')
keymap('n', '<C-right>', '<C-w>>')
keymap('n', '<C-up>', '<C-w>+')
keymap('n', '<C-down>', '<C-w>-')

-- NvimTree
keymap('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', opts)

-- Telescope
--keymap('n', '<leader>sf', "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>", opts)
keymap('n', '<leader>sb', '<cmd>Telescope buffers theme=dropdown<cr>', opts)
keymap('n', '<leader>sd', '<cmd>Telescope diagnostics theme=dropdown<cr>', opts)
keymap('n', '<leader>sf', '<cmd>Telescope find_files theme=dropdown<cr>', opts)
keymap('n', '<leader>sh', '<cmd>Telescope help_tags theme=dropdown<cr>', opts)
keymap('n', '<leader>so', '<cmd>Telescope oldfiles theme=dropdown<cr>', opts)
keymap('n', '<leader>sk', '<cmd>Telescope keymaps theme=dropdown<cr>', opts)
keymap('n', '<leader>sw', '<cmd>Telescope live_grep theme=dropdown<cr>', opts)

-- Lspsaga
keymap('n', '<leader>la', '<cmd>Lspsaga code_action<cr>', opts)
keymap('n', '<leader>ld', '<cmd>Lspsaga peek_definition<cr>', opts)
keymap('n', '<leader>lf', '<cmd>Lspsaga finder<cr>', opts)
keymap('n', '<leader>lo', '<cmd>Lspsaga outline<cr>', opts)
keymap('n', '<leader>lr', '<cmd>Lspsaga rename<cr>', opts)
keymap('n', 'g]', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
keymap('n', 'g[', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
keymap('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
--keymap('n', 'gp', vim.lsp.buf.references, opts)

-- Comment 
keymap('n', '<leader>cl', '<cmd>lua require("Comment.api").toggle.linewise.current()<cr>', opts)
keymap('n', '<leader>cb', '<cmd>lua require("Comment.api").toggle.blockwise.current()<cr>', opts)
keymap('x', '<leader>cl', '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>', opts)
keymap('x', '<leader>cb', function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
            require("Comment.api").toggle.blockwise(vim.fn.visualmode())
        end, opts)


-- Gitsign
keymap('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>', opts)

-- Terminal 
keymap('t', 'jkl', '<C-\\><C-n>', opts)
keymap('n', '<leader>tf','<cmd>ToggleTerm direction=float<cr>')
keymap('n', '<leader>th','<cmd>ToggleTerm direction=horizontal<cr>')
keymap('n', '<leader>tv','<cmd>ToggleTerm direction=vertical<cr>')

-- Dap
    vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
    vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
    vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end)
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end)
    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end)
