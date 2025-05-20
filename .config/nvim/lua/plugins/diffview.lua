return {
  'sindrets/diffview.nvim',
  lazy = true,
  config = function()
    vim.opt.fillchars:append('diff: ')
    require('diffview').setup({})
  end
}
