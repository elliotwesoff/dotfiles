return {
  'nvim-telescope/telescope.nvim',
  lazy = true,
  event = 'BufReadPost',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = require('telescope.themes').get_ivy {
        layout_config = { height = 0.3 },
        mappings = {
          i = {
            ["<C-h>"] = "which_key"
          }
        },
        file_ignore_patterns = {
          "tmp"
        }
      },
      pickers = {},
      extensions = {}
    })
  end
}
