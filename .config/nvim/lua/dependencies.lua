local plugins = require('plugin_config')
local M = {}

function M.use_dependencies(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'lervag/vimtex'
  use 'nvim-treesitter/nvim-treesitter'
  use 'simrat39/symbols-outline.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'JManch/sunset.nvim'
  use 'tamton-aquib/duck.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'numToStr/Comment.nvim', config = plugins.apply_comment_config }
  use { 'gorbit99/codewindow.nvim', config = plugins.apply_codewindow_config }
  use { 'dnlhc/glance.nvim', config = plugins.apply_glance_config }
  use { 'xorid/swap-split.nvim', config = plugins.apply_swap_split_config }
  use { 'windwp/nvim-autopairs', config = plugins.apply_autopairs_config }
  use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'folke/zen-mode.nvim', config = plugins.apply_zenmode_config, commit = '38a660094dd023176ed4d6ecb1fe028546717f78' }
  -- use({
  --   'folke/noice.nvim',
  --   config = plugins.apply_noice_config,
  --   requires = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' }
  -- })

  -- colorschemes
  use 'Yazeed1s/oh-lucy.nvim'
  use 'olimorris/onedarkpro.nvim'
  use 'shaunsingh/seoul256.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'sainnhe/edge'
  use 'yorik1984/newpaper.nvim'
  use 'nyoom-engineering/oxocarbon.nvim'
  use { 'mcchrish/zenbones.nvim', requires = 'rktjmp/lush.nvim' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'rose-pine/neovim', as = 'rose-pine' }


  -- nvim-cmp (autocomplete)
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'ray-x/cmp-treesitter'

  -- debuggers
  -- use { 'mfussenegger/nvim-dap-ui', requires = 'mfussenegger/nvim-dap' }
end

return M

