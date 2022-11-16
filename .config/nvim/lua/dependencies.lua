local plugins = require('plugin_config')

local M = {}

function M.use_dependencies(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'dense-analysis/ale'
  use 'nvim-treesitter/nvim-treesitter'
  use 'Furkanzmc/zettelkasten.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'lervag/vimtex'
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }
  use { 'stevearc/aerial.nvim', config = plugins.apply_aerial_config }
  use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
  use { 'gorbit99/codewindow.nvim', config = plugins.apply_codewindow_config }
  use({
    'folke/noice.nvim',
    config = plugins.apply_noice_config,
    requires = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' }
  })

  -- colorschemes
  use 'Mofiqul/adwaita.nvim'
  use 'Yazeed1s/oh-lucy.nvim'
  use 'olimorris/onedarkpro.nvim'
  use 'shaunsingh/seoul256.nvim'

  -- ddc insanity
  -- use 'Shougo/ddc.vim'
  -- use 'vim-denops/denops.vim'
  -- use 'Shougo/ddc-around'
  -- use 'Shougo/ddc-matcher_head'
  -- use 'Shougo/ddc-sorter_rank'
  -- use 'Shougo/ddc-nvim-lsp'
  -- use 'Shougo/ddc-ui-native'
  -- use 'delphinus/ddc-treesitter'
  -- use 'matsui54/ddc-buffer'

  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'ray-x/cmp-treesitter'
end

return M

