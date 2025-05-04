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
  vim.lsp.config['ruby_lsp'] = {
    cmd = { 'ruby-lsp' },
    on_attach = attach_fn,
  }

  vim.lsp.config['ts_ls'] = {
    cmd = { 'typescript-language-server' },
    on_attach = attach_fn
  }

  vim.lsp.config['ccls'] = {
    cmd = { 'ccls' },
    on_attach = attach_fn
  }

  vim.lsp.config['pyright'] = {
    cmd = { 'pyright-langserver --stdio' },
    on_attach = attach_fn
  }

  -- vim.lsp.enable({
  --   'luals',
  --   'ts_ls',
  --   'ruby_lsp',
  --   'ccls',
  --   'pyright'
  -- })
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
