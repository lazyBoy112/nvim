return {
  n = {
    { '<C-h>', '<cmd>wincmd h<cr>', 'move left' },
    { '<C-j>', '<cmd>wincmd j<cr>', 'move down' },
    { '<C-k>', '<cmd>wincmd k<cr>', 'move up' },
    { '<C-l>', '<cmd>wincmd l<cr>', 'move up' },
    { '<C-m>', '<C-w>=', 'equal window' },
    { '<C-left>', '<C-w><', 'resize left' },
    { '<C-right>', '<C-w>>', 'resize right' },
    { '<C-down>', '<C-w>-', 'resize down' },
    { '<C-up>', '<C-w>+', 'resize right' },
    { '<A-j>', ':m .+1<CR>==', 'move line up(n)' },
    { '<A-k>', ':m .-2<CR>==', 'move line down(n)' },
    { '<A-h>', '<<', 'shift line left' },
    { '<A-l>', '>>', 'shift line right' },
    { '<leader>bc', '<cmd>e $MYVIMRC | :cd %:p:h<cr>', 'configure neovim'},
    { 'bd', '<cmd>bd<cr>', 'delete buffer' },

    { '<tab>', '<cmd>bnext<cr>', 'next buffer' },
    { '<S-tab>', '<cmd>bprevious<cr>', 'previuos buffer' },

    { '<leader>e', '<cmd>NvimTreeToggle<cr>', 'file browser' },

    -- Saga
    { '<leader>la<cr>', '<cmd>Lspsaga code_action', 'Code action' },
    { '<leader>ld<cr>', '<cmd>Lspsaga peek_definition<cr>', 'definition' },
    { 'g[', '<cmd>Lspsaga diagnostic_jump_next<cr>', 'next diagnostic' },
    { 'g]', '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'prev diagnostic' },
    { 'K', '<cmd>Lspsaga hover_doc<cr>', 'hove document' },
    { '<leader>le', '<cmd>Lspsaga show_workspace_diagnostics ++float<cr>', 'show all diagnostic' },
    { '<leader>lr', '<cmd>Lspsaga rename<cr>', 'remame' },
    { '<leader>lf', '<cmd>Lspsaga finder<cr>', 'finder' },
    { '<leader>ld', '<cmd>Lspsaga show_workspace_diagnostics<cr>', 'show diagnostic'},

    { '<leader>sf', '<cmd>Telescope find_files theme=dropdown<cr>', 'find find' },
    { '<leader>sw', '<cmd>Telescope live_grep theme=dropdown<cr>', 'find word' },
    { '<leader>so', '<cmd>Telescope oldfiles theme=dropdown<cr>', 'oldfiles' },
    { '<leader>sh', '<cmd>Telescope help_tags theme=dropdown<cr>', 'help tags' },
    { '<leader>sv', '<cmd>Telescope vim_options theme=dropdown<cr>','vim options' },
    { '<leader>sk', '<cmd>Telescope keymaps theme=dropdown<cr>', 'vim keymap' },

    { '<leader>bf', '<cmd>foldclose<cr>', 'foldclose' },
    { '<leader>bg', '<cmd>foldopen<cr>', 'foldopen' },
    { '<leader>bv', '<cmd>source $MYVIMRC<cr>', 'reload neovim' },

    -- Gitsigns
    { '<leader>gs', '<cmd>Gitsigns toggle_signs<cr>', 'toggle sign'},
    { '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>', 'toggle blame'},
    { '<leader>gw', '<cmd>Gitsigns toggle_word_diff<cr>', 'toggle git word'},
    { '<leader>gl', '<cmd>Gitsigns toggle_linehl<cr>', 'toggle line hl'},

  },
  i = {
    { '<C-h>' ,'<C-\\><C-N><C-w>h', 'move left' },
    { '<C-j>' ,'<C-\\><C-N><C-w>j', 'move down' },
    { '<C-k>' ,'<C-\\><C-N><C-w>k', 'move up' },
    { '<C-l>' ,'<C-\\><C-N><C-w>l', 'move right' },
  },
  v = {
    { '<A-j>', ":m '>+1<CR>gv", 'move line up(n)' },
    { '<A-k>', ":m '<-2<CR>gv", 'move line down(n)' },
    { '<A-h>', '<gv', 'shift line left' },
    { '<A-l>', '>gv', 'shift line right' },

    { 'p', 'P', 'pretier paster' },
  },
  t = {
    { '<C-h>' ,'<C-\\><C-N><C-w>h', 'move left' },
    { '<C-j>' ,'<C-\\><C-N><C-w>j', 'move down' },
    { '<C-k>' ,'<C-\\><C-N><C-w>k', 'move up' },
    { '<C-l>' ,'<C-\\><C-N><C-w>l', 'move right' },
    { '<C-t>', '<cmd>lua OpenFloatTerm()<cr>'},
  },
}
