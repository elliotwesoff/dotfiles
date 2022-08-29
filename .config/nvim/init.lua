require("og-init")

og_vim_init()

require'lspconfig'.pyright.setup{}

local keymap_opts = { noremap = true, silent = true }

------------------- PLUGINS ------------------------
------------------- END PLUGINS --------------------


------------------- KEY MAPPINGS -------------------
vim.api.nvim_set_keymap('n', '<Leader>json=', ":%!python3 -m json.tool<CR>", keymap_opts)
vim.api.nvim_set_keymap('n', '<C-n>', ':vnew<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<A-n>', ':new<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><left>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><down>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><up>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><right>', keymap_opts)
vim.api.nvim_set_keymap('n', '<left>', '<C-w><left>', keymap_opts)
vim.api.nvim_set_keymap('n', '<down>', '<C-w><down>', keymap_opts)
vim.api.nvim_set_keymap('n', '<up>', '<C-w><up>', keymap_opts)
vim.api.nvim_set_keymap('n', '<right>', '<C-w><right>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-[>', ':bprevious<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-]>', ':bnext<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F5>', ':edit<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F7>', ':buffers!<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F8>', ':messages<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F6>', ':registers<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F9>', ':NERDTreeToggle<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', 'Q', ':q<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', 'W', ':wa<CR>', keymap_opts)
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', keymap_opts)
vim.api.nvim_set_keymap('i', 'jk', '<Esc>:w<CR>', keymap_opts)


------------------- LSP CONFIG -------------------
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, keymap_opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, keymap_opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 50,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

------------------- END LSP CONFIG -------------------

