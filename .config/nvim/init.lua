local lazy = require('lazy_config')
local settings = require('settings')
local keymaps = require('keymaps')

settings.COLORSCHEME_LIGHT = 'dayfox'
settings.COLORSCHEME_DARK = 'nightfox'

vim.g.mapleader = ' '

lazy.bootstrap()
lazy.init()

settings.apply_settings()
keymaps.apply_keymaps()
