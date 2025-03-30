return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v0.8.2',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
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
    keymap = require('keymaps').ext_keymaps.blink_cmp,
    signature = { enabled = true }
  }
}
