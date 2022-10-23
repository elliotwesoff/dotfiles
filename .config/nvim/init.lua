local dependencies = require('dependencies')
local settings = require('settings')
local keymaps = require('key_mappings')
local plugins = require('plugin_config')
local custom_fns = require('custom_functions')


require('packer').startup(dependencies.use_dependencies)

settings.apply_settings()

keymaps.create_user_commands()
keymaps.apply_keymaps()

custom_fns.clear_bg_color()

plugins.apply_ddc_config()
plugins.apply_lsp_config()
plugins.apply_lualine_config()
plugins.apply_nvim_tree_config()
plugins.apply_telescope_config()
plugins.apply_treesitter_config()
plugins.apply_comment_config()
plugins.apply_peek_config()
plugins.apply_symbolsoutline_config()
plugins.apply_codewindow_config()
-- plugins.apply_indent_blankline_config()

