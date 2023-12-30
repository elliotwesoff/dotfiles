local M = {}

M.ext_keymaps = {
  comment = {
    toggler = { line = '<C-/>', block = 'gbc' },
    opleader = { line = '<C-/>', block = 'gb' },
    extra = { above = 'gcO', below = 'gco', eol = 'gcA' }
  }
}

function M.apply_keymaps()
  -- look!!! 
  -- Shift + F1-12: <F13><F14><F15><F16><F17><F18><F19><F20><F21><F22><F23><F24>
  -- Ctrl  + F1-12: <F25><F26><F27><F28><F29><F30><F31><F32><F33><F34><F35><F36>
  -- Alt   + F1-12: <F49><F50><F51><F52><F53><F54><F55><F56><F57><F58><F59><F60>
  -- but this is only on linux, windows sends different keys -____________-'

  local helpers = require('helpers')
  local opts = { noremap = true, silent = true }

  -- insert mode mappings
  vim.keymap.set('i', 'jj', '<Esc>', opts)
  vim.keymap.set('i', 'jk', '<Esc>:w<CR>', opts)
  vim.keymap.set('i', 'jq', '<Esc>:wq<CR>', opts)
  vim.keymap.set('i', '<C-BS>', '<C-W>', opts)
  vim.keymap.set('i', '<C-,>', '<Esc>:tabprevious<CR>', opts)
  vim.keymap.set('i', '<C-.>', '<Esc>:tabnext<CR>', opts)

  -- normal mode mappings
  vim.keymap.set('n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
  vim.keymap.set('n', '-', "<cmd>lua require('oil').open()<cr>", { desc = 'Open parent directory' })
  vim.keymap.set('n', '<C-q>', ':q<CR>', opts)
  vim.keymap.set('n', '<C-s>', ':write<CR>', opts)
  vim.keymap.set('n', '<C-n>', ':vnew<CR>', opts)
  vim.keymap.set('n', '<C-t>', ':tabnew<CR>', opts)
  vim.keymap.set('n', '<A-t>', ':terminal<CR>', opts)
  vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
  vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
  vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
  vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)
  vim.keymap.set('n', '<C-,>', ':tabprevious<CR>', opts)
  vim.keymap.set('n', '<C-.>', ':tabnext<CR>', opts)
  vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', opts)
  vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', opts)
  vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', opts)
  vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', opts)
  vim.keymap.set('n', '<C-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
  vim.keymap.set('n', '<A-h>', 'zM', opts)
  vim.keymap.set('n', '<A-j>', 'zr', opts)
  vim.keymap.set('n', '<A-k>', 'zm', opts)
  vim.keymap.set('n', '<A-l>', 'zR', opts)
  vim.keymap.set('n', '<F1>', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
  vim.keymap.set('n', '<F2>', "<cmd>lua require('telescope.builtin').registers()<cr>", opts)
  vim.keymap.set('n', '<F3>', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
  vim.keymap.set('n', '<F4>', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
  vim.keymap.set('n', '<F5>', ':edit<CR>', opts)
  vim.keymap.set('n', '<F6>', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
  vim.keymap.set('n', '<F7>', "<cmd>lua require('telescope.builtin').colorscheme()<cr>", opts)
  vim.keymap.set('n', '<F8>', "<cmd>lua require('zen-mode').toggle()", opts)
  vim.keymap.set('n', '<F9>', "<cmd>lua require('glance').actions.open('implementations')<cr>", opts)
  vim.keymap.set('n', '<F10>', "<cmd>lua require('glance').actions.open('type_definitions')<cr>", opts)
  vim.keymap.set('n', '<F11>', "<cmd>lua require('glance').actions.open('references')<cr>", opts)
  vim.keymap.set('n', '<F12>', "<cmd>lua require('glance').actions.open('definitions')<cr>", opts)
  vim.keymap.set('n', '<F13>', ':echo "F13 unset"<CR>', opts)
  vim.keymap.set('n', '<F14>', ':echo "F14 unset"<CR>', opts)
  vim.keymap.set('n', '<F15>', ':echo "F15 unset"<CR>', opts)
  vim.keymap.set('n', '<F16>', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
  vim.keymap.set('n', '<F17>', helpers.refresh_config, opts)
  vim.keymap.set('n', '<F18>', "<cmd>lua require('telescope.builtin').marks()<cr>", opts)
  vim.keymap.set('n', '<F19>', ':messages<CR>', opts)
  vim.keymap.set('n', '<F23>', "<cmd>lua require('telescope.builtin').treesitter()<cr>", opts)
  vim.keymap.set('n', '<S-F11>', "<cmd>lua require('telescope.builtin').treesitter()<cr>", opts) -- windows garbage
  vim.keymap.set('n', '<F24>', "<cmd>lua require('symbols-outline').toggle_outline()<cr>", opts)
  vim.keymap.set('n', '<S-F12>', "<cmd>lua require('symbols-outline').toggle_outline()<cr>", opts) -- windows garbage
  vim.keymap.set('n', '<F25>', "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
  vim.keymap.set('n', '<F26>', "<cmd>lua require('telescope.builtin').git_stash()<cr>", opts)
  vim.keymap.set('n', '<F27>', "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)
  vim.keymap.set('n', '<F28>', "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)
  vim.keymap.set('n', '<F29>', "<cmd>lua require('ibl').debounced_refresh()<cr>", opts) -- ctrl + f5
  vim.keymap.set('n', '<F36>', "<cmd>lua require('aerial').toggle()<cr>", opts) -- ctrl + f12
  vim.keymap.set('n', '<F60>', "<cmd>lua require('glance').actions.open('references')<cr>", opts) -- alt + f12
  vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
  vim.keymap.set('n', '<leader>v', ':edit ~/dotfiles/.config/nvim/init.lua<CR>', opts)
  vim.keymap.set('n', '<leader>cb', helpers.clear_bg_color, opts)
  vim.keymap.set('n', '<leader>bg', helpers.toggle_theme, opts)

  -- terminal mode mappings
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts) -- switch to normal mode
end

function M.apply_lsp_keymaps()
  local keymap_opts = { noremap = true, silent = true }
  vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, keymap_opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_opts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.setloclist, keymap_opts)
end

function M.apply_lsp_buffer_keymaps(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>.', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>,', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>s', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>o', vim.lsp.buf.formatting, bufopts)
end

function M.apply_aerial_keymaps(bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrev<CR>', {})
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNext<CR>', {})
end

return M

