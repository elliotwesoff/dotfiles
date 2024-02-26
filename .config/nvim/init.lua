local lazy = require('lazy_config')
local settings = require('settings')
local keymaps = require('keymaps')

settings.COLORSCHEME_LIGHT = 'dayfox'
-- settings.COLORSCHEME_DARK = 'carbonfox'
settings.COLORSCHEME_DARK = 'default'

lazy.bootstrap()
lazy.init()

settings.apply_settings()
keymaps.apply_keymaps()

-- vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

