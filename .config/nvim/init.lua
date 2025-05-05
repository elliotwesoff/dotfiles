local lazy = require('lazy_config')
local settings = require('settings')
local keymaps = require('keymaps')

-- settings.COLORSCHEME_LIGHT = 'tokyobones'
-- settings.COLORSCHEME_DARK = 'habamax'

settings.COLORSCHEME_LIGHT = 'catppuccin-latte'
settings.COLORSCHEME_DARK = 'burzum'

lazy.bootstrap()
lazy.init()

settings.apply_settings()
keymaps.apply_keymaps()
