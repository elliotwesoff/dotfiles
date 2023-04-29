local settings = require('settings')
local keymaps = require('key_mappings')
local plugins = require('plugin_config')

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'lervag/vimtex'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'simrat39/symbols-outline.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'JManch/sunset.nvim'
  use 'tamton-aquib/duck.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'numToStr/Comment.nvim', config = plugins.apply_comment_config }
  use { 'gorbit99/codewindow.nvim', config = plugins.apply_codewindow_config }
  use { 'dnlhc/glance.nvim', config = plugins.apply_glance_config }
  use { 'windwp/nvim-autopairs', config = plugins.apply_autopairs_config }
  use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'folke/zen-mode.nvim', config = plugins.apply_zenmode_config, commit = '38a660094dd023176ed4d6ecb1fe028546717f78' }

  -- colorschemes
  use 'shaunsingh/seoul256.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'AlexvZyl/nordic.nvim'
  use { 'mcchrish/zenbones.nvim', requires = 'rktjmp/lush.nvim' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'EdenEast/nightfox.nvim' }

  -- nvim-cmp (autocomplete)
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'ray-x/cmp-treesitter'
end)

settings.apply_settings()
keymaps.apply_keymaps()

plugins.apply_lsp_config()
plugins.apply_lsp_signature_config()
plugins.apply_nvim_cmp_config()
plugins.apply_lualine_config()
plugins.apply_nvim_tree_config()
plugins.apply_telescope_config()
plugins.apply_treesitter_config()
plugins.apply_peek_config()
plugins.apply_symbolsoutline_config()
plugins.apply_indentblankline_config()
plugins.apply_sunset_config()
plugins.apply_catppuccin_config()

vim.cmd.colorscheme("dayfox")

