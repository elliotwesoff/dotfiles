local lazy = require('lazy_config')
local settings = require('settings')
local keymaps = require('keymaps')

settings.COLORSCHEME_LIGHT = 'catppuccin'
settings.COLORSCHEME_DARK = 'carbonfox'

lazy.bootstrap()
lazy.init()

settings.apply_settings()
keymaps.apply_keymaps()
