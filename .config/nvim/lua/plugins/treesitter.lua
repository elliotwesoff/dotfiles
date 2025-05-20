return {
  {
    'nvim-treesitter/nvim-treesitter',
    enabled = true,
    lazy = true,
    event = 'BufReadPre',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'c',
          'cpp',
          'lua',
          'python',
          'typescript',
          'ruby',
          'sql',
          'markdown',
          'fish',
          'bash',
          'make',
          'udev',
          'toml'
        },
        sync_install = false,
        auto_install = true,
        ignore_install = { },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = false
        },
        refactor = {
          highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
          },
          highlight_current_scope = {
            enable = true
          },
          smart_rename = {
            enable = true
          },
          navigation = {
            enable = true,
            keymaps = { -- TODO: move to keymaps.lua
              goto_definition = 'gnd',
              list_definitions = 'gnD',
              list_definitions_toc = 'gO',
              goto_next_usage = '<a-n>',
              goto_previous_usage = '<a-p>',
            }
          }
        }
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-refactor',
    enabled = true,
    lazy = true,
    event = 'BufReadPre'
  }
}
