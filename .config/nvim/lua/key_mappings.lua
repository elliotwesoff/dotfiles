local M = {}

-- look!!! 
-- Shift + F1-12: <F13><F14><F15><F16><F17><F18><F19><F20><F21><F22><F23><F24>
-- Ctrl  + F1-12: <F25><F26><F27><F28><F29><F30><F31><F32><F33><F34><F35><F36>
-- Alt   + F1-12: <F49><F50><F51><F52><F53><F54><F55><F56><F57><F58><F59><F60>

function M.apply_keymaps()
  local peek = require('peek')
  local custom_fns = require('custom_functions')
  local nvim_tree = require('nvim-tree.api')
  local zen_mode = require('zen-mode')
  local telescope = require('telescope.builtin')
  local symbols_outline = require('symbols-outline')
  local duck = require('duck')
  local opts = { noremap = true, silent = true }

  -- insert mode mappings
  vim.keymap.set('i', 'jj', '<Esc>', opts)
  vim.keymap.set('i', 'jk', '<Esc>:w<CR>', opts)
  vim.keymap.set('i', '<C-s>', ':w<CR>', opts)
  vim.keymap.set('i', '<C-BS>', '<cmd>:execute "normal! db"<cr>', opts)
  vim.keymap.set('i', '<C-,>', '<Esc>:tabprevious<CR>', opts)
  vim.keymap.set('i', '<C-.>', '<Esc>:tabnext<CR>', opts)

  -- normal mode mappings
  vim.keymap.set('n', 'gd', telescope.lsp_definitions)
  vim.keymap.set('n', '<C-q>', ':q<CR>', opts)
  vim.keymap.set('n', '<C-s>', ':write<CR>', opts)
  vim.keymap.set('n', '<C-n>', ':vnew<CR>', opts)
  vim.keymap.set('n', '<C-t>', ':tabnew<CR>', opts)
  vim.keymap.set('n', '<A-t>', ':terminal<CR>', opts)
  vim.keymap.set('n', '<C-h>', '<C-w><left>', opts)
  vim.keymap.set('n', '<C-j>', '<C-w><down>', opts)
  vim.keymap.set('n', '<C-k>', '<C-w><up>', opts)
  vim.keymap.set('n', '<C-l>', '<C-w><right>', opts)
  vim.keymap.set('n', '<left>', '<C-w><left>', opts)
  vim.keymap.set('n', '<down>', '<C-w><down>', opts)
  vim.keymap.set('n', '<up>', '<C-w><up>', opts)
  vim.keymap.set('n', '<right>', '<C-w><right>', opts)
  vim.keymap.set('n', '<left>', '<C-w><left>', opts)
  vim.keymap.set('n', '<C-,>', ':tabprevious<CR>', opts)
  vim.keymap.set('n', '<C-.>', ':tabnext<CR>', opts)
  vim.keymap.set('n', '<F1>', telescope.help_tags, opts)
  vim.keymap.set('n', '<F2>', telescope.registers, opts)
  vim.keymap.set('n', '<F3>', telescope.buffers, opts)
  vim.keymap.set('n', '<F4>', telescope.current_buffer_fuzzy_find, opts)
  vim.keymap.set('n', '<F5>', telescope.live_grep, opts)
  vim.keymap.set('n', '<F6>', telescope.find_files, opts)
  vim.keymap.set('n', '<F7>', telescope.colorscheme, opts)
  vim.keymap.set('n', '<F8>', zen_mode.toggle, opts)
  vim.keymap.set('n', '<F9>', '<cmd>Glance implementations<cr>', opts)
  vim.keymap.set('n', '<F10>', '<cmd>Glance type_definitions<cr>', opts)
  vim.keymap.set('n', '<F11>', '<cmd>Glance definitions<cr>', opts)
  vim.keymap.set('n', '<F12>', '<cmd>Glance references<cr>', opts)
  vim.keymap.set('n', '<F13>', telescope.git_status, opts)
  vim.keymap.set('n', '<F14>', telescope.git_stash, opts)
  vim.keymap.set('n', '<F15>', telescope.git_branches, opts)
  vim.keymap.set('n', '<F16>', telescope.git_commits, opts)
  vim.keymap.set('n', '<F17>', custom_fns.refresh_config, opts)
  vim.keymap.set('n', '<F18>', telescope.marks, opts)
  vim.keymap.set('n', '<F19>', ':messages<CR>', opts)
  vim.keymap.set('n', '<leader>so', symbols_outline.open_outline, opts)
  vim.keymap.set('n', '<leader>r', ':edit<CR>', opts)
  vim.keymap.set('n', '<leader>h', ':noh<CR>', opts)
  vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
  vim.keymap.set('n', '<leader>v', ':edit ~/dotfiles/.config/nvim/init.lua<CR>', opts)
  vim.keymap.set('n', '<leader>km', ':edit ~/dotfiles/.config/nvim/lua/key_mappings.lua<CR>', opts)
  vim.keymap.set('n', '<leader>cb', custom_fns.clear_bg_color, opts)
  vim.keymap.set('n', '<leader>bg', custom_fns.toggle_theme, opts)
  vim.keymap.set('n', '<leader>tt', nvim_tree.tree.open, opts)
  vim.keymap.set('n', '<leader>json=', custom_fns.buf_format_json, opts)
  vim.keymap.set('n', '<leader>p', peek.open, opts)
  vim.keymap.set('n', '<leader>P', peek.close, opts)
  vim.keymap.set('n', '<leader>dd', duck.hatch)

  -- terminal mode mappings
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts) -- switch to normal mode
end

function M.create_user_commands()
  -- found a better way to do this, but keeping them around for later reference.
  -- vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
  -- vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
end

function M.apply_lsp_keymaps()
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local keymap_opts = { noremap = true, silent = true }
  vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, keymap_opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_opts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.setloclist, keymap_opts)
end

function M.apply_lsp_buffer_keymaps(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

  -- functionality here is normally covered by NvimTree
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)

  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)

  -- covered by glance.nvim
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<A-F12>', vim.lsp.buf.references, bufopts)

  -- this produces a deprecated warning. idk i don't use it anyway
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

return M

