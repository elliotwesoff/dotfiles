return {
  'nvim-telescope/telescope.nvim',
  lazy = true,
  event = 'BufReadPost',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local send_to_and_open_loclist = function(bufnr)
      local actions = require('telescope.actions')
      actions.send_to_loclist(bufnr)
      actions.open_loclist(bufnr)
    end

    local keymaps = {
      ["<C-h>"] = "which_key",
      ["<C-l>"] = send_to_and_open_loclist -- named fn for which_key
    }

    require('telescope').setup({
      defaults = require('telescope.themes').get_ivy {
        layout_config = { height = 0.3 },
        mappings = {
          i = keymaps,
          n = keymaps
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
