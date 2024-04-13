return {
  {
    'nvim-treesitter/nvim-treesitter',
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
  },
  {
    'nvim-treesitter/nvim-treesitter-refactor',
    lazy = true,
    event = 'BufReadPre'
  },
  {
    'stevearc/oil.nvim',
    lazy = true,
    config = function()
      require('oil').setup()
    end
  },
  {
    'folke/zen-mode.nvim',
    lazy = true
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = require('telescope.themes').get_ivy {
          layout_config = { height = 0.3 },
          mappings = {
            i = {
              ["<C-h>"] = "which_key"
            }
          }
        },
        pickers = {},
        extensions = {}
      })
    end
  },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'kyazdani42/nvim-web-devicons' },
  --   config = function()
  --     require('lualine').setup {
  --       options = {
  --         component_separators = { left = '🍕', right = '' },
  --         section_separators = { left = '', right = '' }
  --       }
  --     }
  --   end
  -- },
  {
    'simrat39/symbols-outline.nvim',
    lazy = true,
    config = function()
      require("symbols-outline").setup({
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = 'right',
        relative_width = true,
        width = 15,
        auto_close = false,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = false,
        preview_bg_highlight = 'Pmenu',
        autofold_depth = 1,
        auto_unfold_hover = true,
        fold_markers = { '', '' },
        wrap = false,
      })
    end
  },
  {
    'stevearc/aerial.nvim',
    lazy = true,
    config = function()
      local keymaps = require('keymaps')
      require('aerial').setup({
        layout = { placement = 'window', default_direction = 'right' },
        on_attach = keymaps.apply_aerial_keymaps
      })
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('ibl').setup() end,
    event = 'BufReadPre'
  },
  {
    'dnlhc/glance.nvim',
    lazy = true,
    config = function()
      require('glance').setup({
        height = 25
      })
    end
  },
  {
    'numToStr/Comment.nvim',
    event = 'BufReadPost',
    config = function()
      local km = require('keymaps').ext_keymaps.comment
      require('Comment').setup({
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = km.toggler,
        opleader = km.opleader,
        extra = km.extra,
        mappings = { basic = true, extra = true },
        pre_hook = nil,
        post_hook = nil
      })
    end
  },
  {
    'JManch/sunset.nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      local sunset = require('sunset')
      local settings = require('settings')
      local lat = os.getenv("LOC_LAT")
      local long = os.getenv("LOC_LONG")
      sunset.setup({
        latitude = tonumber(lat),
        longitude = tonumber(long),
        day_callback = function()
          vim.cmd.colorscheme(settings.COLORSCHEME_LIGHT)
          vim.o.background = 'light'
        end,
        night_callback = function()
          vim.cmd.colorscheme(settings.COLORSCHEME_DARK)
          vim.o.background = 'dark'
        end
      })
    end
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 350
    end,
    opts = { }
  },
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },
      }
    }
  }
}
