return {
  {
    'mcchrish/zenbones.nvim',
    lazy = false,
    priority = 998,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      -- local bg_contrast = { lightness = 'bright', darkness = 'stark' }
      local bg_contrast = {}
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
    lazy = false,
    priority = 999
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 999
  },
  {
    'EdenEast/nightfox.nvim',
    name = 'nightfox',
    lazy = false,
    priority = 999
  },
  {
    'ramojus/mellifluous.nvim',
    lazy = false,
    priority = 999,
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
