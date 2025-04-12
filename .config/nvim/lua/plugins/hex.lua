return {
  {
    'RaafatTurki/hex.nvim',
    event = "VeryLazy",
    config = function()
      require('hex').setup()
    end
  }
}
