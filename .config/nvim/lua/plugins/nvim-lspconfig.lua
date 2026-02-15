return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      local lsp = vim.lsp
      local keymaps = require('keymaps')
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lsp_flags = {}

      local attach_fn = function (client, bufnr)
        keymaps.apply_lsp_buffer_keymaps(client, bufnr)
      end

      local lsp_server_opts = { on_attach = attach_fn, flags = lsp_flags, capabilities = capabilities }

      keymaps.apply_lsp_keymaps()

      lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
        lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          virtual_text = false
        }
      )

      lsp.config('pyright', lsp_server_opts)
      lsp.config('ccls', lsp_server_opts)
      lsp.config('ruby_lsp', lsp_server_opts)
      lsp.config('ts_ls', lsp_server_opts)
      lsp.config('fish_lsp', lsp_server_opts)
      lsp.config('rust_analyzer', lsp_server_opts)
      lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
        capabilities = capabilities,
        on_attach = attach_fn,
      })

      lsp.enable({
        'pyright',
        'ccls',
        'ruby_lsp',
        'ts_ls',
        'fish_lsp',
        'rust_analyzer',
        'lua_ls'
      })
    end
  }
}
