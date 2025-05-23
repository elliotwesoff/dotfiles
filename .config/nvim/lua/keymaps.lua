local M = {}

M.ext_keymaps = {
  comment = {
    toggler = { line = '<C-/>', block = 'gbc' },
    opleader = { line = '<C-/>', block = 'gb' },
    extra = { above = 'gcO', below = 'gco', eol = 'gcA' }
  },
  blink_cmp = {
    editor = {
      preset = 'none',
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<Up>'] = { 'scroll_documentation_up', 'fallback' },
      ['<Down>'] = { 'scroll_documentation_down', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' }
    },
    cmdline = {
      preset = 'none',
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<C-CR>'] = { 'accept', 'fallback' },
      ['<Esc>'] = {
        -- https://github.com/Saghen/blink.cmp/issues/547#issuecomment-2593493560
        function(cmp)
          if cmp.is_visible() then
            cmp.cancel()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, true, true), "n", true)
          end
        end
      }
    }
  }
}

function M.apply_keymaps()
  -- personal keymap philosophy:
  -- 1. navigation and session-wide keymaps are bound to C (ctrl + something)
  -- 2. buffer-specific keybinds, i.e. commands which only affect the buffer
  --    that the cursor is currently in, are bound to A (alt + something)
  -- 3. LSP, telescope, and typical IDE shortcuts are bound to <leader>
  -- 4. main IDE functions and misc. shortcuts like go to definition,
  --    go to implementation, references, etc. are bound to F<1-60>

  -- Shift + F1-12: <F13-24>
  -- Ctrl  + F1-12: <F25-36>
  -- Alt   + F1-12: <F49-60>

  local helpers = require('helpers')
  local opts = { noremap = true, silent = true }

  -- dev mappings
  vim.keymap.set('n', 'vx', ':lua require("explorer").select()<CR>')
  vim.keymap.set('n', '<leader>w', ':write<CR>:source<CR>')

  -- insert mode mappings

  vim.keymap.set('i', 'jj', '<Esc>', opts)
  vim.keymap.set('i', 'jk', '<Esc>:w<CR>', opts)
  vim.keymap.set('i', 'jx', '<Esc>:wq<CR>', opts)
  vim.keymap.set('i', '<C-BS>', '<C-W>', opts)
  vim.keymap.set('i', '<C-,>', '<Esc>:tabprevious<CR>', opts)
  vim.keymap.set('i', '<C-.>', '<Esc>:tabnext<CR>', opts)

  -- normal mode mappings

  vim.keymap.set('n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
  vim.keymap.set('n', '-', "<cmd>lua require('oil').open()<cr>", { desc = 'Open parent directory' })
  vim.keymap.set('n', '`', "<Cmd>lua require('oil').open()<cr>", { desc = 'Open parent directory' })
  vim.keymap.set('n', '<C-q>', ':q<CR>', opts)
  vim.keymap.set('n', '<C-s>', ':write<CR>', opts)
  vim.keymap.set('n', '<C-n>', ':vnew<CR>', opts)
  vim.keymap.set('n', '<C-t>', ':tabnew<CR>', opts)
  vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
  vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
  vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
  vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)
  vim.keymap.set('n', '<C-,>', ':tabprevious<CR>', opts)
  vim.keymap.set('n', '<C-.>', ':tabnext<CR>', opts)
  vim.keymap.set('n', '<C-[>', ':cprevious<CR>', opts)
  vim.keymap.set('n', '<C-]>', ':cnext<CR>', opts)
  vim.keymap.set('n', '<C-;>', ':lprevious<CR>', opts)
  vim.keymap.set('n', '<C-\'>', ':lnext<CR>', opts)
  vim.keymap.set('n', '<C-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
  vim.keymap.set('n', '<A-=>', '<cmd>wincmd =<CR>', opts)
  vim.keymap.set('n', '<A-h>', 'zM', opts)
  vim.keymap.set('n', '<A-j>', 'zr', opts)
  vim.keymap.set('n', '<A-k>', 'zm', opts)
  vim.keymap.set('n', '<A-l>', 'zR', opts)
  vim.keymap.set('n', '<A-t>', ':terminal<CR>', opts)

  -- leader mappings
  -- philosophy: as of right now i'm using the default leader key ('\').
  --             '\' is all the way on the right side of the keyboard, so
  --             to keep things ergonomic and fast, all or most leader
  --             mappings should be on the left side of the keyboard.
  --             lesser used ones and non-dev related keymaps can be on the
  --             right hand side.
  vim.keymap.set('n', '<leader>v', ':edit ~/dotfiles/.config/nvim/init.lua<CR>', opts)
  vim.keymap.set('n', '<leader>k', ':edit ~/dotfiles/.config/nvim/lua/keymaps.lua<CR>', opts)
  -- vim.keymap.set('n', '<leader>r', "<cmd>lua require('telescope.builtin').registers()<cr>", opts)
  vim.keymap.set('n', '<leader>b', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
  vim.keymap.set('n', '<leader>s', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
  vim.keymap.set('n', '<leader>j', "<cmd>lua require('telescope.builtin').jumplist()<cr>", opts)
  vim.keymap.set('n', '<leader>m', ":Mason<cr>", opts)
  vim.keymap.set('n', '<leader>t', ":Telescope<CR>", opts)
  vim.keymap.set('n', '<leader>cs', ":SunsetToggle<CR>", opts)
  vim.keymap.set('n', '<leader>cf', helpers.toggle_theme, { desc = 'Toggle background'})
  vim.keymap.set('n', '<leader>cc', helpers.clear_bg_color, { desc = 'Transparent background'})
  vim.keymap.set('n', '<leader>z', "<cmd>lua require('zen-mode').toggle()<cr>", opts)
  vim.keymap.set('n', '<leader>a', "<cmd>lua require('aerial').toggle()<cr>", opts)
  vim.keymap.set('n', '<leader>h', ":HexToggle<CR>", opts)
  vim.keymap.set('n', '<leader>l', ":Lazy<CR>", opts)
  -- vim.keymap.set('n', '<leader>ls', ":LspStop<CR>", opts)
  -- vim.keymap.set('n', '<leader>lg', ":LspStart<CR>", opts)
  -- vim.keymap.set('n', '<leader>li', ":LspInfo<CR>", opts)

  -- manual requires - because i don't really know wtf lazy is doing sometimes
  vim.keymap.set('n', '<leader>rt', helpers.req_closure('telescope.nvim'), { desc = 'Require telescope' })
  vim.keymap.set('n', '<leader>rl', helpers.req_closure('lsp'), { desc = 'Require lsp' })
  vim.keymap.set('n', '<leader>rb', helpers.req_closure('blink.cmp'), { desc = 'Require blink' })
  vim.keymap.set('n', '<leader>rm', helpers.req_closure('mason.nvim'), { desc = 'Require mason' })
  vim.keymap.set('n', '<leader>rz', helpers.req_closure('zen-mode'), { desc = 'Require zen-mode' })

  -- pipe buffer contents to jq, then replace buffer contents with jq's stdout stream
  -- vim.keymap.set('n', '<leader>q', ":%!jq '.'<CR>", opts) -- TODO: make this a function somewhere else

  -- terminal mode mappings
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts) -- switch to normal mode

  -- F<1-12>
  vim.keymap.set('n', '<F1>', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
  vim.keymap.set('n', '<F2>', "<cmd>lua require('telescope.builtin').registers()<cr>", opts)
  vim.keymap.set('n', '<F3>', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
  vim.keymap.set('n', '<F4>', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
  vim.keymap.set('n', '<F5>', ':edit<CR>', opts)
  vim.keymap.set('n', '<F6>', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
  vim.keymap.set('n', '<F7>', "<cmd>lua require('telescope.builtin').colorscheme()<cr>", opts)
  vim.keymap.set('n', '<F8>', "<cmd>lua require('zen-mode').toggle()<cr>", opts)
  vim.keymap.set('n', '<F9>', "<cmd>lua require('glance').actions.open('implementations')<cr>", opts)
  vim.keymap.set('n', '<F10>', "<cmd>lua require('glance').actions.open('type_definitions')<cr>", opts)
  vim.keymap.set('n', '<F11>', "<cmd>lua require('glance').actions.open('references')<cr>", opts)
  vim.keymap.set('n', '<F12>', "<cmd>lua require('glance').actions.open('definitions')<cr>", opts)

  -- SHIFT + F<1-12>
  vim.keymap.set('n', '<F13>', ':echo "F13 not set"<CR>', opts)
  vim.keymap.set('n', '<F14>', ':echo "F14 not set"<CR>', opts)
  vim.keymap.set('n', '<F15>', ':echo "F15 not set"<CR>', opts)
  vim.keymap.set('n', '<F16>', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
  vim.keymap.set('n', '<F17>', helpers.refresh_config, opts)
  vim.keymap.set('n', '<F18>', "<cmd>lua require('telescope.builtin').marks()<cr>", opts)
  vim.keymap.set('n', '<F19>', ':messages<CR>', opts)
  vim.keymap.set('n', '<F20>', ':echo "F20 not set"<CR>', opts)
  vim.keymap.set('n', '<F21>', ':echo "F21 not set"<CR>', opts)
  vim.keymap.set('n', '<F22>', ':echo "F22 not set"<CR>', opts)
  vim.keymap.set('n', '<F23>', "<cmd>lua require('telescope.builtin').treesitter()<cr>", opts)
  vim.keymap.set('n', '<S-F11>', "<cmd>lua require('telescope.builtin').treesitter()<cr>", opts) -- windows garbage
  vim.keymap.set('n', '<F24>', "<cmd>Outline<cr>", opts)
  vim.keymap.set('n', '<S-F12>', "<cmd>Outline<cr>", opts) -- windows garbage

  -- CTRL + F<1-12>
  vim.keymap.set('n', '<F25>', "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
  vim.keymap.set('n', '<F26>', "<cmd>lua require('telescope.builtin').git_stash()<cr>", opts)
  vim.keymap.set('n', '<F27>', "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)
  vim.keymap.set('n', '<F28>', "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)
  vim.keymap.set('n', '<F29>', "<cmd>lua require('ibl').debounced_refresh()<cr>", opts) -- ctrl + f5
  vim.keymap.set('n', '<F30>', ':echo "F30 not set"<CR>', opts)
  vim.keymap.set('n', '<F31>', ':echo "F31 not set"<CR>', opts)
  vim.keymap.set('n', '<F32>', ':echo "F32 not set"<CR>', opts)
  vim.keymap.set('n', '<F33>', ':echo "F33 not set"<CR>', opts)
  vim.keymap.set('n', '<F34>', ':echo "F34 not set"<CR>', opts)
  vim.keymap.set('n', '<F35>', ':echo "F35 not set"<CR>', opts)
  vim.keymap.set('n', '<F36>', "<cmd>lua require('aerial').toggle()<cr>", opts) -- ctrl + f12

  -- where did F37 - F48 go?

  -- ALT + F<1-12>
  vim.keymap.set('n', '<F49>', ':echo "F49 not set"<CR>', opts)
  vim.keymap.set('n', '<F50>', ':echo "F50 not set"<CR>', opts)
  vim.keymap.set('n', '<F51>', ':echo "F51 not set"<CR>', opts)
  vim.keymap.set('n', '<F52>', ':echo "F52 not set"<CR>', opts)
  vim.keymap.set('n', '<F53>', ':echo "F53 not set"<CR>', opts)
  vim.keymap.set('n', '<F54>', ':echo "F54 not set"<CR>', opts)
  vim.keymap.set('n', '<F55>', ':echo "F55 not set"<CR>', opts)
  vim.keymap.set('n', '<F56>', ':echo "F56 not set"<CR>', opts)
  vim.keymap.set('n', '<F57>', ':echo "F57 not set"<CR>', opts)
  vim.keymap.set('n', '<F58>', ':echo "F58 not set"<CR>', opts)
  vim.keymap.set('n', '<F59>', ':echo "F59 not set"<CR>', opts)
  vim.keymap.set('n', '<F60>', "<cmd>lua require('glance').actions.open('references')<cr>", opts) -- alt + f12
end

function M.apply_lsp_keymaps()
  local keymap_opts = { noremap = true, silent = true }
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Diagnostics in quickfix list'})
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_opts)
end

function M.apply_lsp_buffer_keymaps(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'grd', vim.lsp.buf.definition)
  vim.keymap.set('n', '<leader><leader>', vim.lsp.buf.hover, bufopts)
end

return M
