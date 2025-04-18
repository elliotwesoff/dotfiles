return {
  'nvim-lualine/lualine.nvim',
  lazy = true,
  event = 'BufReadPre',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        component_separators = { left = '🍕', right = '🍕' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          'buffer_number', -- magical undocumented option via chatgpt, don't delete!
        },
        lualine_b = {{'filename', path = 1}},
        lualine_c = {'diagnostics'},
        lualine_x = {'branch', 'diff'},
        -- lualine_y = {},
        -- lualine_z = {}
      },
      inactive_sections = {
        lualine_a = { 'buffer_number' },
        lualine_b = {'filename'},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      }
    }
  end
}
