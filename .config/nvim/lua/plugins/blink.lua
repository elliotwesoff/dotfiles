local keymaps = require('keymaps').ext_keymaps.blink_cmp

return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v1.1.1',
  event = 'BufReadPre',
  opts = {
    enabled = function()
      return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
      and vim.bo.buftype ~= "prompt"
      and vim.b.completion ~= false
    end,
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    completion = {
      -- menu = { auto_show = function(ctx) return ctx.mode ~= 'cmdline' end },
      -- documentation = { auto_show = true, auto_show_delay_ms = 0 }
    },
    keymap = keymaps.editor,
    cmdline = {
      completion = {
        menu = {
          auto_show = true
        }
      },
      keymap = keymaps.cmdline
    },
    signature = { enabled = true }
  }
}
