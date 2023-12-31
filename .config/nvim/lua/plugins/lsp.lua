return {
    {
      'neovim/nvim-lspconfig',
      config = function()
        local keymaps = require('keymaps')
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lsp_flags = { debounce_text_changes = 0 }
        local attach_fn = keymaps.apply_lsp_buffer_keymaps
        local lsp_server_opts = { on_attach = attach_fn, flags = lsp_flags, capabilities = capabilities }

        keymaps.apply_lsp_keymaps()

        lspconfig.pyright.setup(lsp_server_opts)
        lspconfig.tsserver.setup(lsp_server_opts)
        lspconfig.ccls.setup(lsp_server_opts)
        lspconfig.texlab.setup(lsp_server_opts)
        lspconfig.solargraph.setup(lsp_server_opts)
        lspconfig.lua_ls.setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              }
            }
          },
          capabilities = capabilities,
          on_attach = attach_fn
        }

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            virtual_text = false
          }
        )
      end
    },
    {
      'ray-x/lsp_signature.nvim',
      event = 'InsertEnter'
    },
}
