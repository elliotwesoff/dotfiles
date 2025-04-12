return {
  {
    'nvim-treesitter/nvim-treesitter',
    enabled = false,
    lazy = true,
    event = 'BufReadPre',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "c",
          "cpp",
          "lua",
          "python",
          "typescript",
          "c_sharp",
          "ruby",
          "sql",
          "markdown",
          "latex"
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
          navigation = {
            enable = true,
            keymaps = { -- TODO: move to keymaps.lua
              goto_definition = "gnd",
              list_definitions = "gnD",
              list_definitions_toc = "gO",
              goto_next_usage = "<a-n>",
              goto_previous_usage = "<a-p>",
            }
          }
        }
      })
    end
  }
}
