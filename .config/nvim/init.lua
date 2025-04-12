local lazy = require('lazy_config')
local settings = require('settings')
local keymaps = require('keymaps')
local lsp = require('lsp')

settings.COLORSCHEME_LIGHT = 'tokyobones'
settings.COLORSCHEME_DARK = 'habamax'

lazy.bootstrap()
lazy.init()

settings.apply_settings()
keymaps.apply_keymaps()
lsp.apply_lsp_config()
lsp.apply_diagnostic_config()
