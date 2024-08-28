return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local keymaps = require('keymaps')
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lsp_flags = { debounce_text_changes = 0 }

      local attach_fn = function (client, bufnr)
        keymaps.apply_lsp_buffer_keymaps(client, bufnr)
        require'lsp_signature'.on_attach(client, bufnr)
      end

      local lsp_server_opts = { on_attach = attach_fn, flags = lsp_flags, capabilities = capabilities }

      keymaps.apply_lsp_keymaps()

      lspconfig.pyright.setup(lsp_server_opts)
      -- lspconfig.pyright.setup({
      --   on_attach = attach_fn,
      --   flags = lsp_flags,
      --   capabilities = capabilities,
      --   settings = {
      --     python = {
      --       pythonPath = '/home/elliot/code/UNLV_CS/490/bin/python'
      --     }
      --   }
      -- })
      lspconfig.tsserver.setup({
        root_dir = lspconfig.util.root_pattern('.git'),
        on_attach = attach_fn,
        flags = lsp_flags,
        capabilities = capabilities
      })
      lspconfig.ccls.setup(lsp_server_opts)
      lspconfig.texlab.setup(lsp_server_opts)
      -- lspconfig.solargraph.setup(lsp_server_opts)
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
      lspconfig.ruby_lsp.setup(lsp_server_opts)

      -- require('java').setup()
      -- lspconfig.jdtls.setup(lsp_server_opts)

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          virtual_text = false
        }
      )
    end
  }
}
