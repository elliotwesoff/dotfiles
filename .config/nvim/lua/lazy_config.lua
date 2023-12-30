local pc = require('plugin_config')
local M = {}

function M.init()
  local plugins = {
    -- core
    { 'nvim-treesitter/nvim-treesitter', config = pc.apply_treesitter_config },
    { 'nvim-treesitter/nvim-treesitter-refactor' },
    { 'stevearc/oil.nvim', config = pc.apply_oil_config, lazy = true },
    { 'folke/zen-mode.nvim', config = pc.apply_zenmode_config, lazy = true },
    { 'neovim/nvim-lspconfig', config = pc.apply_lsp_config },
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = pc.apply_telescope_config,
      lazy = true
    },
    {
      'nvim-lualine/lualine.nvim',
      enabled = true,
      -- dependencies = { 'kyazdani42/nvim-web-devicons' },
      config = pc.apply_lualine_config
    },

    -- general
    { 'simrat39/symbols-outline.nvim', config = pc.apply_symbolsoutline_config, lazy = true },
    { 'stevearc/aerial.nvim', config = pc.apply_aerial_config, lazy = true },
    { 'lukas-reineke/indent-blankline.nvim', config = pc.apply_ibl_config, lazy = true },
    { 'dnlhc/glance.nvim', config = pc.apply_glance_config, lazy = true },
    {
      'numToStr/Comment.nvim',
      config = pc.apply_comment_config,
      lazy = false,
      priority = 1000
    },
    {
      'JManch/sunset.nvim',
      enabled = true,
      config = pc.apply_sunset_config,
      lazy = false,
      priority = 1000
    },
    {
      'windwp/nvim-autopairs',
      config = pc.apply_autopairs_config,
      event = "InsertEnter"
    },
    {
      'ray-x/lsp_signature.nvim',
      config = pc.apply_lsp_signature_config,
      event = "InsertEnter"
    },

    -- colorschemes
    { 'shaunsingh/seoul256.nvim', lazy = true },
    { 'mcchrish/zenbones.nvim', dependencies = { 'rktjmp/lush.nvim' }, lazy = true },
    { 'catppuccin/nvim', name = 'catppuccin', config = pc.apply_catppuccin_config, lazy = true },
    { 'rose-pine/neovim', name = 'rose-pine', lazy = true },
    { 'EdenEast/nightfox.nvim', name = 'nightfox', lazy = true },
    { 'ramojus/mellifluous.nvim', config = pc.apply_mellifluous_config, lazy = true },

    -- nvim-cmp (autocomplete)
    {
      'hrsh7th/nvim-cmp',
      config = pc.apply_nvim_cmp_config,
      event = "InsertEnter",
      dependencies = {
       'hrsh7th/cmp-nvim-lsp',
       'hrsh7th/cmp-buffer',
       'hrsh7th/cmp-path',
       'hrsh7th/cmp-cmdline',
       'L3MON4D3/LuaSnip',
       'saadparwaiz1/cmp_luasnip',
       'ray-x/cmp-treesitter',
       'onsails/lspkind.nvim',
      }
    }
  }

  local opts = {}
  require('lazy').setup(plugins, opts)
end

function M.bootstrap()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

return M
