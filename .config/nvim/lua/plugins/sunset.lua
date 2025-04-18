return {
  'JManch/sunset.nvim',
  event = 'BufReadPre',
  lazy = true,
  priority = 1000,
  config = function()
    local sunset = require('sunset')
    local settings = require('settings')
    sunset.setup({
      latitude = tonumber(os.getenv("LOC_LAT")),
      longitude = tonumber(os.getenv("LOC_LONG")),
      day_callback = function()
        vim.cmd.colorscheme(settings.COLORSCHEME_LIGHT)
        vim.o.background = 'light'
      end,
      night_callback = function()
        vim.cmd.colorscheme(settings.COLORSCHEME_DARK)
        vim.o.background = 'dark'
      end
    })
  end
}
