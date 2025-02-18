local lazy = require('lazy_config')
local settings = require('settings')
local keymaps = require('keymaps')

-- settings.COLORSCHEME_LIGHT = 'seoulbones'
settings.COLORSCHEME_LIGHT = 'tokyobones'
-- settings.COLORSCHEME_LIGHT = 'zenwritten'
settings.COLORSCHEME_DARK = 'nordbones'

-- vim.cmd.colorscheme('habamax')

-- vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

lazy.bootstrap()
lazy.init()

settings.apply_settings()
keymaps.apply_keymaps()
