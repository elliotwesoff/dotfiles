return {
  {
    'shaunsingh/seoul256.nvim',
    lazy = true
  },
  {
    'mcchrish/zenbones.nvim',
    lazy = true,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      local bg_contrast = { lightness = 'bright', darkness = 'stark' }
      vim.g.kanagawabones = bg_contrast
      vim.g.zenbones = bg_contrast
      vim.g.vimbones = bg_contrast
      vim.g.neobones = bg_contrast
      vim.g.seoulbones = bg_contrast
      vim.g.tokyobones = bg_contrast
      vim.g.rosebones = bg_contrast
      vim.g.nordbones = bg_contrast
      vim.g.duckbones = bg_contrast
      vim.g.forestbones = bg_contrast
    end
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true
  },
  {
    'EdenEast/nightfox.nvim',
    name = 'nightfox',
    lazy = true
  },
  {
    'ramojus/mellifluous.nvim',
    lazy = true,
    config = function()
      require('mellifluous').setup({
        mellifluous = {
          neutral = true,
          bg_contrast = 'hard' -- options: 'soft', 'medium', 'hard'
        }
      })
    end
  }
}
