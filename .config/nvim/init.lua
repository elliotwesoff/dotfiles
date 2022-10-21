local settings = require('settings')
local keymaps = require('key_mappings')
local plugins = require('plugin_config')
local custom_fns = require('custom_functions')


require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'rking/ag.vim'
  use 'rafi/awesome-vim-colorschemes'
  use 'Mofiqul/adwaita.nvim'
  use 'dracula/vim'
  use 'jiangmiao/auto-pairs'
  use 'dense-analysis/ale'
  use 'nvim-treesitter/nvim-treesitter'
  use 'Furkanzmc/zettelkasten.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  use {
    'gorbit99/codewindow.nvim',
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup({
        minimap_width = 20,
        width_multiplier = 4,
        use_lsp = true,
        use_treesitter = true,
        exclude_filetypes = {},
        z_index = 1
      })
      codewindow.apply_default_keybinds()
    end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }


  -- ddc insanity
  use 'Shougo/ddc.vim'
  use 'vim-denops/denops.vim'
  use 'Shougo/ddc-around'
  use 'Shougo/ddc-matcher_head'
  use 'Shougo/ddc-sorter_rank'
  use 'Shougo/ddc-nvim-lsp'
  use 'delphinus/ddc-treesitter'
  use 'matsui54/ddc-buffer'
end)


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

require("symbols-outline").setup()

