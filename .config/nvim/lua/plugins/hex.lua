return {
  'RaafatTurki/hex.nvim',
  lazy = true,
  config = function()
    require('hex').setup({
      -- format for reading iTunesDB
      dump_cmd = 'xxd -c 12 -g 4'
    })
  end
}
