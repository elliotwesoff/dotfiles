return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      local keymaps = require('keymaps')
      local lspconfig = require('lspconfig')
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lsp_flags = {}

      local attach_fn = function (client, bufnr)
        keymaps.apply_lsp_buffer_keymaps(client, bufnr)
      end

      local lsp_server_opts = { on_attach = attach_fn, flags = lsp_flags, capabilities = capabilities }

      keymaps.apply_lsp_keymaps()

      lspconfig.pyright.setup(lsp_server_opts)
      lspconfig.ccls.setup(lsp_server_opts)
      lspconfig.ruby_lsp.setup(lsp_server_opts)
      lspconfig.ts_ls.setup(lsp_server_opts)
      lspconfig.fish_lsp.setup(lsp_server_opts)
      lspconfig.rust_analyzer.setup(lsp_server_opts)
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        },
        capabilities = capabilities,
        on_attach = attach_fn
      })

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          virtual_text = false
        }
      )
    end
  }
}
