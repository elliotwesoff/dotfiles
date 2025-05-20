return {
  'JManch/sunset.nvim',
  enabled = true,
  lazy = false,
  config = function()
    local sunset = require('sunset')
    local settings = require('settings')
    local lat = tonumber(os.getenv('LOC_LAT'))
    local long = tonumber(os.getenv('LOC_LONG'))
    local light_theme = settings.COLORSCHEME_LIGHT
    local dark_theme = settings.COLORSCHEME_DARK

    if (string.find(light_theme, 'bones') or string.find(dark_theme, 'bones')) then
      require('zenbones')
    end

    sunset.setup({
      latitude = lat,
      longitude = long,
      day_callback = function()
        vim.o.background = 'light'
        vim.cmd.colorscheme(light_theme)
      end,
      night_callback = function()
        vim.o.background = 'dark'
        vim.cmd.colorscheme(dark_theme)
      end
    })
  end
}
