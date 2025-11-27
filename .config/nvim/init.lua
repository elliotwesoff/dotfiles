local lazy = require('lazy_config')
local settings = require('settings')
local keymaps = require('keymaps')
local user_commands = require('user_commands')

settings.COLORSCHEME_LIGHT = 'onedark'
settings.COLORSCHEME_DARK = 'burzum'

lazy.bootstrap()
lazy.init()

settings.apply_settings()
keymaps.apply_keymaps()
user_commands.apply_user_commands()
