return {
  'RaafatTurki/hex.nvim',
  event = 'BufReadPost',
  lazy = true,
  config = function()
    require('hex').setup()
  end
}
