return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufReadPre',
  config = function()
    require('ibl').setup({
      scope = {
        enabled = true,
        show_exact_scope = true
      }
    })
  end
}
