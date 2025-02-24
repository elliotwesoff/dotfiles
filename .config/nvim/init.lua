local lazy = require('lazy_config')
local settings = require('settings')
local keymaps = require('keymaps')

settings.COLORSCHEME_LIGHT = 'tokyobones'
settings.COLORSCHEME_DARK = 'nordbones'
-- vim.cmd.colorscheme('habamax')

lazy.bootstrap()
lazy.init()

settings.apply_settings()
keymaps.apply_keymaps()
