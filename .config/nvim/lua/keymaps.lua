local M = {}

function M.apply_keymaps()
  -- personal keymap philosophy:
  -- 1. navigation and session-wide keymaps are bound to CTRL + something
  -- 2. buffer-specific keybinds are bound to ALT + something
  -- 3. LSP, telescope, and typical IDE shortcuts are bound to <leader>
  -- 4. main IDE functions and misc. shortcuts like go to definition,
  --    go to implementation, references, etc. are bound to gr

  local helpers = require('helpers')
  local opts = { noremap = true, silent = true }

  -- insert mode mappings

  vim.keymap.set('i', 'jj', '<Esc>', opts)
  vim.keymap.set('i', 'jk', '<Esc>:w<CR>', opts)
  vim.keymap.set('i', 'jx', '<Esc>:wq<CR>', opts)
  vim.keymap.set('i', '<C-BS>', '<C-W>', opts)

  -- normal mode mappings

  vim.keymap.set('n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
  vim.keymap.set('n', '-', "<cmd>lua require('oil').open()<cr>", { desc = 'Open parent directory' })
  vim.keymap.set('n', '<C-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
  vim.keymap.set('n', '<C-q>', ':quit<CR>', opts)
  vim.keymap.set('n', '<Esc>', helpers.conditional_qf_close, opts)
  vim.keymap.set('n', '<C-s>', ':write<CR>', opts)
  vim.keymap.set('n', '<C-n>', ':vnew<CR>', opts)
  vim.keymap.set('n', '<C-t>', ':tabnew<CR>', opts)
  vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
  vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
  vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
  vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)
  vim.keymap.set('n', '<C-,>', ':tabprevious<CR>', opts)
  vim.keymap.set('n', '<C-.>', ':tabnext<CR>', opts)
  vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>', opts)
  vim.keymap.set('n', '<Tab>', ':tabnext<CR>', opts)
  vim.keymap.set('n', '<C-[>', ':cprevious<CR>', opts)
  vim.keymap.set('n', '<C-]>', ':cnext<CR>', opts)
  vim.keymap.set('n', '<A-[>', ':lprevious<CR>', opts)
  vim.keymap.set('n', '<A-]>', ':lnext<CR>', opts)
  vim.keymap.set('n', '<A-=>', '<cmd>wincmd =<CR>', opts)
  vim.keymap.set('n', '<A-h>', 'zM', opts)
  vim.keymap.set('n', '<A-j>', 'zr', opts)
  vim.keymap.set('n', '<A-k>', 'zm', opts)
  vim.keymap.set('n', '<A-l>', 'zR', opts)
  vim.keymap.set('n', '<A-t>', ':terminal<CR>', opts)

  -- leader mappings

  vim.keymap.set('n', '<leader>q', ':quit<CR>', opts)
  vim.keymap.set('n', '<leader>v', ':edit ~/dotfiles/.config/nvim/init.lua<CR>', opts)
  vim.keymap.set('n', '<leader>k', ':edit ~/dotfiles/.config/nvim/lua/keymaps.lua<CR>', opts)
  vim.keymap.set('n', '<leader>p', ':edit ~/dotfiles/.config/nvim/lua/plugins<CR>', opts)
  vim.keymap.set('n', '<leader>b', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
  vim.keymap.set('n', '<leader>s', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
  vim.keymap.set('n', '<leader>j', "<cmd>lua require('telescope.builtin').jumplist()<cr>", opts)
  vim.keymap.set('n', '<leader>m', ':Mason<cr>', opts)
  vim.keymap.set('n', '<leader>t', ':Telescope<CR>', opts)
  vim.keymap.set('n', '<leader>h', ':HexToggle<CR>', opts)
  vim.keymap.set('n', '<leader>l', ':Lazy<CR>', opts)
  vim.keymap.set('n', '<leader>cs', ':SunsetToggle<CR>', opts)
  vim.keymap.set('n', '<leader>z', "<cmd>lua require('zen-mode').toggle()<cr>", opts)
  vim.keymap.set('n', '<leader>cf', helpers.toggle_theme, { desc = 'Toggle background'})
  vim.keymap.set('n', '<leader>cc', helpers.clear_bg_color, { desc = 'Transparent background'})
  vim.keymap.set('n', '<leader>rt', helpers.req_closure('telescope.nvim'), { desc = 'Require telescope' }) -- manual requires - because i don't really
  vim.keymap.set('n', '<leader>rl', helpers.req_closure('lsp'), { desc = 'Require lsp' })                  -- know wtf lazy is doing sometimes.
  vim.keymap.set('n', '<leader>rb', helpers.req_closure('blink.cmp'), { desc = 'Require blink' })
  vim.keymap.set('n', '<leader>rm', helpers.req_closure('mason.nvim'), { desc = 'Require mason' })
  vim.keymap.set('n', '<leader>rz', helpers.req_closure('zen-mode'), { desc = 'Require zen-mode' })
  vim.keymap.set('n', '<leader>rh', helpers.req_closure('hex.nvim'), { desc = 'Require hex' })
  vim.keymap.set('n', '<leader>ro', helpers.req_closure('outline.nvim'), { desc = 'Require hex' })
  vim.keymap.set('n', '<leader>rd', helpers.req_closure('diffview'), { desc = 'Require diffview' })

  -- terminal mode
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts) -- switch to normal mode

  -- F<1-12>
  vim.keymap.set('n', '<F1>', ":tab h<cr><cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
  vim.keymap.set('n', '<F12>', '<cmd>Outline<cr>', opts)

  -- SHIFT        + F1-12 => <F13-24>
  -- CTRL         + F1-12 => <F25-36>
  -- CTRL + SHIFT + F1-12 => <F37-48>
  -- ALT          + F1-12 => <F49-60>
end

function M.apply_lsp_keymaps()
  local show_hover = false

  local hover_toggle_fn = function()
    show_hover = not show_hover
    if not show_hover then
      vim.cmd('fclose')
    end
  end


  vim.api.nvim_create_autocmd('CursorHold', {
    callback = function()
      if show_hover then
        vim.lsp.buf.hover({ focusable = true })
      end
    end
  })

  vim.keymap.set("n", "K", hover_toggle_fn)
  vim.keymap.set("n", "`", hover_toggle_fn)
  vim.keymap.set('n', '<leader>d', vim.diagnostic.setqflist, { desc = 'Diagnostics in quickfix list' })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
end


function M.apply_lsp_buffer_keymaps(_client, bufnr)
  local function genopts(desc)
    return { noremap = true, silent = true, buffer = bufnr, desc = desc }
  end

  local list_opts = { loclist = true, reuse_win = false }

  -- lsp
  vim.keymap.set('n', 'gr1', vim.lsp.buf.code_action, genopts('code action'))
  vim.keymap.set('n', 'gr2', vim.lsp.buf.clear_references, genopts('clear references'))
  vim.keymap.set('n', 'gr3', vim.lsp.buf.document_highlight, genopts('document highlight'))
  vim.keymap.set('n', 'gr4', vim.lsp.buf.format, genopts('format document'))
  vim.keymap.set('n', 'gr5', vim.lsp.buf.incoming_calls, genopts('incoming calls'))
  vim.keymap.set('n', 'gr6', vim.lsp.buf.hover, genopts('hover'))
  vim.keymap.set('n', 'gr7', vim.lsp.buf.list_workspace_folders, genopts('list workspace folders'))
  vim.keymap.set('n', 'gr8', vim.lsp.buf.outgoing_calls, genopts('outgoing calls'))
  vim.keymap.set('n', 'gr9', vim.lsp.buf.remove_workspace_folder, genopts('remove workspace folder'))
  vim.keymap.set('n', 'gr0', vim.lsp.buf.rename, genopts('rename'))
  vim.keymap.set('n', 'grq', vim.lsp.buf.signature_help, genopts('signature help'))
  vim.keymap.set('n', 'grw', vim.lsp.buf.typehierarchy, genopts('type hierarchy'))
  vim.keymap.set('n', 'gra', function() vim.lsp.buf.references(nil, list_opts) end, genopts('references (loclist)'))
  vim.keymap.set('n', 'grs', function() vim.lsp.buf.definition(list_opts) end, genopts('go to definition (loclist)'))
  vim.keymap.set('n', 'grd', function() vim.lsp.buf.declaration(list_opts) end, genopts('go to declaration (loclist)'))
  vim.keymap.set('n', 'grf', function() vim.lsp.buf.implementation(list_opts) end, genopts('go to implementation (loclist)'))
  vim.keymap.set('n', 'grj', function() vim.lsp.buf.type_definition(list_opts) end, genopts('go to type definition (loclist)'))
  vim.keymap.set('n', 'grk', function() vim.lsp.buf.document_symbol(list_opts) end, genopts('all document symbols (loclist)'))
  vim.keymap.set('n', 'grl', function() vim.lsp.buf.workspace_symbol(list_opts) end, genopts('workspace symbols (loclist)'))
end

M.ext_keymaps = {
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
        function(cmp) -- https://github.com/Saghen/blink.cmp/issues/547#issuecomment-2593493560
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

return M
