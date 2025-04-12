return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl').setup({
        scope = {
          enabled = true,
          show_exact_scope = true
        }
      })
    end,
    event = 'BufReadPre'
  }
}
