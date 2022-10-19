local custom_fns = require('custom_functions')
local keymap_opts = { noremap = true, silent = true }

local function apply_keymaps()
  vim.keymap.set('n', 'Q', ':q<CR>', keymap_opts)
  vim.keymap.set('n', 'W', ':wa<CR>', keymap_opts)
  vim.keymap.set('n', '<C-n>', ':vnew<CR>', keymap_opts)
  vim.keymap.set('n', '<A-n>', ':new<CR>', keymap_opts)
  vim.keymap.set('n', '<C-t>', ':tabnew<CR>', keymap_opts)
  vim.keymap.set('n', '<A-t>', ':terminal<CR>', keymap_opts)
  vim.keymap.set('n', '<A-h>', '<C-w><left>', keymap_opts)
  vim.keymap.set('n', '<A-j>', '<C-w><down>', keymap_opts)
  vim.keymap.set('n', '<A-k>', '<C-w><up>', keymap_opts)
  vim.keymap.set('n', '<A-l>', '<C-w><right>', keymap_opts)
  vim.keymap.set('n', '<left>', '<C-w><left>', keymap_opts)
  vim.keymap.set('n', '<down>', '<C-w><down>', keymap_opts)
  vim.keymap.set('n', '<up>', '<C-w><up>', keymap_opts)
  vim.keymap.set('n', '<right>', '<C-w><right>', keymap_opts)
  vim.keymap.set('n', '<A-,>', ':tabprevious<CR>', keymap_opts)
  vim.keymap.set('n', '<A-.>', ':tabnext<CR>', keymap_opts)
  vim.keymap.set('n', '<F1>', '<cmd>Telescope help_tags<CR>', keymap_opts)
  vim.keymap.set('n', '<F2>', '<cmd>Telescope registers<CR>', keymap_opts)
  vim.keymap.set('n', '<F3>', '<cmd>Telescope buffers<CR>', keymap_opts)
  vim.keymap.set('n', '<F4>', '<cmd>Telescope live_grep<CR>', keymap_opts)
  vim.keymap.set('n', '<F5>', ':edit<CR>', keymap_opts)
  vim.keymap.set('n', '<F6>', '<cmd> Telescope file_browser<CR>', keymap_opts)
  vim.keymap.set('n', '<F7>', '<cmd>Telescope current_buffer_fuzzy_find<CR>', keymap_opts)
  vim.keymap.set('n', '<F8>', ':messages<CR>', keymap_opts)
  vim.keymap.set('n', '<F9>', ':NvimTreeToggle<CR>', keymap_opts)
  vim.keymap.set('n', '<F10>', '<cmd>Telescope git_status<CR>', keymap_opts)
  vim.keymap.set('n', '<F11>', '<cmd>Telescope treesitter<CR>', keymap_opts)
  vim.keymap.set('n', '<F12>', '<cmd>Telescope lsp_definitions<CR>', keymap_opts)
  vim.keymap.set('n', '<A-F1>', '<cmd>Telescope git_status<CR>', keymap_opts)
  vim.keymap.set('n', '<A-F2>', '<cmd>Telescope git_stash<CR>', keymap_opts)
  vim.keymap.set('n', '<A-F3>', '<cmd>Telescope git_branches<CR>', keymap_opts)
  vim.keymap.set('n', '<A-F4>', '<cmd>Telescope git_commits<CR>', keymap_opts)
  vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', keymap_opts)
  vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', keymap_opts)
  vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', keymap_opts)
  vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', keymap_opts)
  vim.keymap.set('n', '<leader>1', ':colorscheme onehalflight<CR>', { noremap = true, silent = false })
  vim.keymap.set('n', '<leader>2', ':colorscheme seoul256-light<CR>', { noremap = true, silent = false })
  vim.keymap.set('n', '<leader>3', ':colorscheme seoul256<CR>', { noremap = true, silent = false })
  vim.keymap.set('n', '<leader>4', ':colorscheme adwaita<CR>', { noremap = true, silent = false })
  vim.keymap.set('n', '<leader>5', ':colorscheme onehalfdark<CR>', { noremap = true, silent = false })
  vim.keymap.set('n', '<leader>6', ':colorscheme dracula<CR>', { noremap = true, silent = false })
  vim.keymap.set('n', '<leader>0', ':colorscheme desert<CR>', { noremap = true, silent = false })
  vim.keymap.set('n', '<leader>ev', ':tabnew $MYVIMRC<CR>', keymap_opts)
  vim.keymap.set('n', '<leader><F5>', ':RefreshConfig<CR>', keymap_opts)
  vim.keymap.set('n', '<leader>h', ':noh<CR>', keymap_opts)
  vim.keymap.set('n', '<leader>w', ':w<CR>', keymap_opts)
  vim.keymap.set('n', '<leader>q', ':q<CR>', keymap_opts)
  vim.keymap.set('n', '<Tab>', ':NvimTreeFindFile<CR>', keymap_opts)
  vim.keymap.set('i', 'jj', '<Esc>', keymap_opts)
  vim.keymap.set('i', 'jk', '<Esc>:w<CR>', keymap_opts)
  vim.keymap.set('i', '<A-BS>', '<cmd>:execute "normal! db"<CR>', keymap_opts)
  vim.keymap.set('i', '<A-,>', '<Esc>:tabprevious<CR>', keymap_opts)
  vim.keymap.set('i', '<A-.>', '<Esc>:tabnext<CR>', keymap_opts)
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', keymap_opts)
  vim.keymap.set('n', '<Leader>cb', custom_fns.clear_bg_color, keymap_opts)
  vim.keymap.set('n', '<Leader>json=', custom_fns.buf_format_json, keymap_opts)
  vim.keymap.set('n', '<Leader>p', ':PeekOpen<CR>', { noremap = true })
  vim.keymap.set('n', '<Leader>P', ':PeekClose<CR>', { noremap = true })
end

local function create_user_commands()
  vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
  vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
end

return {
  apply_keymaps = apply_keymaps,
  create_user_commands = create_user_commands
}

