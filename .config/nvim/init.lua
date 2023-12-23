local lazy = require('lazy_config')

vim.g.mapleader = ','

lazy.bootstrap(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
lazy.init()

require('settings').apply_settings()
require('keymaps').apply_keymaps()
