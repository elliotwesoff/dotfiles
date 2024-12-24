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
        menu = { auto_show = function(ctx) return ctx.mode ~= 'cmdline' end }
      },
      keymap = {
        preset = 'none',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Up>'] = { 'scroll_documentation_up', 'fallback' },
        ['<Down>'] = { 'scroll_documentation_down', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        -- ['<Esc>'] = { 'hide', 'fallback' }
      },
      signature = { enabled = true }
    }
  }
