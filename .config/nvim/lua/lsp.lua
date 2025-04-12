local keymaps = require('keymaps')
local M = {}

local function attach_fn(client, bufnr)
  keymaps.apply_lsp_buffer_keymaps(client, bufnr)
end

function M.apply_lsp_config()
  keymaps.apply_lsp_keymaps()
  vim.lsp.config['luals'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    on_attach = attach_fn,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        }
      }
    },
  }

  vim.lsp.config['ts_ls'] = { on_attach = attach_fn }
  vim.lsp.config['ruby_lsp'] = { on_attach = attach_fn }
  vim.lsp.config['ccls'] = { on_attach = attach_fn }
  vim.lsp.config['pyrght'] = { on_attach = attach_fn }

  vim.lsp.enable({
    'luals',
    'ts_ls',
    'ruby_lsp',
    'ccls',
    'pyright'
  })
end

function M.apply_diagnostic_config()
  vim.diagnostic.config({ virtual_lines = true })
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true
    }
  )
end

return M
