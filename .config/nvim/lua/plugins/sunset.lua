return {
  'JManch/sunset.nvim',
  enabled = false,
  event = 'BufReadPre',
  lazy = true,
  priority = 1000,
  config = function()
    local sunset = require('sunset')
    local settings = require('settings')
    local light_theme = settings.COLORSCHEME_LIGHT
    local dark_theme = settings.COLORSCHEME_DARK

    if (string.find(light_theme, "bones") or string.find(dark_theme, "bones")) then
      require('zenbones')
    end

    sunset.setup({
      latitude = tonumber(os.getenv("LOC_LAT")),
      longitude = tonumber(os.getenv("LOC_LONG")),
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
