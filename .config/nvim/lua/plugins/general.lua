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
  -- {
  --   'ray-x/lsp_signature.nvim',
  --   event = 'VeryLazy',
  --   opts = {},
  --   config = function(_, opts) require('lsp_signature').setup(opts) end
  -- },
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
          }
        },
        pickers = {},
        extensions = {}
      })
    end
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" } },
    opts = {
      -- Your setup opts here
    },
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
    config = function()
      require('ibl').setup({
        scope = {
          enabled = true,
          show_exact_scope = true
        }
      })
    end,
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
    event = 'BufReadPre',
    lazy = false,
    priority = 1000,
    config = function()
      local sunset = require('sunset')
      local settings = require('settings')
      sunset.setup({
        latitude = tonumber(os.getenv("LOC_LAT")),
        longitude = tonumber(os.getenv("LOC_LONG")),
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
    'RaafatTurki/hex.nvim',
    config = function()
      require('hex').setup()
    end
  }
}
