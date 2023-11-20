local settings = require('settings')
local keymaps = require('key_mappings')
local plugins = require('plugin_config')

require('packer').startup(function(use)
  -- core
  use 'wbthomason/packer.nvim'
  use 'stevearc/oil.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-refactor' -- for hover highlighting
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'folke/zen-mode.nvim', config = plugins.apply_zenmode_config }

  -- general
  use 'JManch/sunset.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'stevearc/aerial.nvim'
  use 'onsails/lspkind.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'dnlhc/glance.nvim', config = plugins.apply_glance_config }
  use { 'numToStr/Comment.nvim', config = plugins.apply_comment_config }
  use { 'windwp/nvim-autopairs', config = plugins.apply_autopairs_config }

  -- colorschemes
  use 'shaunsingh/seoul256.nvim'
  use { 'mcchrish/zenbones.nvim', requires = 'rktjmp/lush.nvim' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'EdenEast/nightfox.nvim', as = 'nightfox' }
  use { 'ramojus/mellifluous.nvim', config = plugins.apply_mellifluous_config }

  -- nvim-cmp (autocomplete)
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'ray-x/cmp-treesitter'

  -- latex
  use 'lervag/vimtex'

  -- markdown
  use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }

  -- duck
  use 'tamton-aquib/duck.nvim'
end)

plugins.apply_lsp_config()
plugins.apply_lsp_signature_config()
plugins.apply_nvim_cmp_config()
plugins.apply_lualine_config()
plugins.apply_telescope_config()
plugins.apply_treesitter_config()
plugins.apply_peek_config()
plugins.apply_symbolsoutline_config()
plugins.apply_ibl_config()
plugins.apply_sunset_config()
plugins.apply_catppuccin_config()
plugins.apply_oil_config()
plugins.apply_aerial_config()

settings.apply_settings()
keymaps.apply_keymaps()

-- hey! go to plugins.apply_sunset_config() for selected colorschemes!
