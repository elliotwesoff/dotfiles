local dependencies = require('dependencies')
local settings = require('settings')
local keymaps = require('key_mappings')
local plugins = require('plugin_config')

require('packer').startup(dependencies.use_dependencies)

vim.cmd([[colorscheme zenbones]])

settings.apply_settings()
keymaps.apply_keymaps()

plugins.apply_lsp_config()
plugins.apply_nvim_cmp_config()
plugins.apply_lualine_config()
plugins.apply_nvim_tree_config()
plugins.apply_telescope_config()
plugins.apply_treesitter_config()
plugins.apply_peek_config()
plugins.apply_symbolsoutline_config()
plugins.apply_indentblankline_config()
plugins.apply_sunset_config()
plugins.apply_illuminate_config()
plugins.apply_nvim_treesitter_refactor_config()

require('illuminate').pause()
