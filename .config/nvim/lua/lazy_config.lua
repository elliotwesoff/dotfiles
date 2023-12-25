local pc = require('plugin_config')
local M = {}

function M.init()
  local plugins = {
    -- core
    { 'nvim-treesitter/nvim-treesitter', config = pc.apply_treesitter_config },
    { 'nvim-treesitter/nvim-treesitter-refactor' },
    { 'stevearc/oil.nvim', config = pc.apply_oil_config },
    { 'neovim/nvim-lspconfig', config = pc.apply_lsp_config },
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, config = pc.apply_telescope_config },
    { 'nvim-lualine/lualine.nvim', enabled = true, dependencies = { 'kyazdani42/nvim-web-devicons' }, config = pc.apply_lualine_config },
    { 'folke/zen-mode.nvim', config = pc.apply_zenmode_config },

    -- general
    { 'onsails/lspkind.nvim' },
    { 'JManch/sunset.nvim', config = pc.apply_sunset_config },
    { 'simrat39/symbols-outline.nvim', config = pc.apply_symbolsoutline_config },
    { 'stevearc/aerial.nvim', config = pc.apply_aerial_config },
    { 'ray-x/lsp_signature.nvim', config = pc.apply_lsp_signature_config },
    { 'lukas-reineke/indent-blankline.nvim', config = pc.apply_ibl_config },
    { 'dnlhc/glance.nvim', config = pc.apply_glance_config },
    { 'numToStr/Comment.nvim', config = pc.apply_comment_config },
    { 'windwp/nvim-autopairs', config = pc.apply_autopairs_config },

    -- colorschemes
    { 'shaunsingh/seoul256.nvim' },
    { 'mcchrish/zenbones.nvim', dependencies = { 'rktjmp/lush.nvim' } },
    { 'catppuccin/nvim', name = 'catppuccin', config = pc.apply_catppuccin_config },
    { 'rose-pine/neovim', name = 'rose-pine' },
    { 'EdenEast/nightfox.nvim', name = 'nightfox' },
    { 'ramojus/mellifluous.nvim', config = pc.apply_mellifluous_config },

    -- nvim-cmp (autocomplete)
    { 'hrsh7th/nvim-cmp', config = pc.apply_nvim_cmp_config },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'ray-x/cmp-treesitter' },
  }

  local opts = {}

  require('lazy').setup(plugins, opts)
end

function M.bootstrap(lazypath)
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
