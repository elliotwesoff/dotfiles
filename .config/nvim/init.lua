local lazy = require('lazy_config')
local settings = require('settings')
local keymaps = require('keymaps')

settings.COLORSCHEME_LIGHT = 'catppuccin'
settings.COLORSCHEME_DARK = 'kanagawabones'

vim.g.mapleader = ' '

lazy.bootstrap(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
lazy.init()

settings.apply_settings()
keymaps.apply_keymaps()
