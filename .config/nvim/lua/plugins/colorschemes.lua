return {
  {
    'mcchrish/zenbones.nvim',
    lazy = true,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      local bg_contrast = {
        -- lightness = 'bright', -- bright/default/dim
        -- darkness = 'stark' -- stark/default/warm
      }
      local colors = { 'kanagawabones', 'zenbones', 'vimbones', 'neobones',
                       'seoulbones', 'tokyobones', 'rosebones', 'nordbones',
                       'duckbones', 'forestbones' }
      for _, color in ipairs(colors) do
        vim.g[color] = bg_contrast
      end
    end
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true,
  },
  {
    'EdenEast/nightfox.nvim',
    name = 'nightfox',
    lazy = true,
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
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    priority = 1000,
    opts = { day_brightness = '0.1' },
  }
}
