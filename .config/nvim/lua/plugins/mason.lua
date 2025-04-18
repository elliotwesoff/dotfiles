return {
  'williamboman/mason.nvim',
  lazy = true,
  event = 'BufReadPre',
  config = function ()
    require('mason').setup()
  end
}
