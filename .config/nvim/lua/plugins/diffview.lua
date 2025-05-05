return {
  'sindrets/diffview.nvim',
  lazy = true,
  hooks = {
    view_opened = function(view)
      vim.cmd([[bdelete 1]])
    end
  }
}
