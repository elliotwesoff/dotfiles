return {
  'dnlhc/glance.nvim',
  lazy = true,
  config = function()
    require('glance').setup({
      height = 25
    })
  end
}
