return {
  {
    'mcchrish/zenbones.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      local bg_contrast = {
        lightness = 'dim', -- bright/default/dim
        darkness = 'stark' -- stark/default/warm
      }
      -- local bg_contrast = {}
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
    name = 'catppuccin'
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine'
  },
  {
    'EdenEast/nightfox.nvim',
    name = 'nightfox'
  },
  {
    'ramojus/mellifluous.nvim',
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
