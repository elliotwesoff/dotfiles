return {
  'goolord/alpha-nvim',
  lazy = false,
  priority = 999,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    _Gopts = { position = 'center', hl = 'Type' }

    local function footer()
      return 'ban the mouse 🐁'
    end

    dashboard.section.footer.val = footer()
    dashboard.section.buttons.val = {
      dashboard.button("e", "new buffer", ":enew<bar>startinsert<cr>"),
      dashboard.button("-", "file explorer", "<cmd>lua require('oil').open()<cr>"),
      dashboard.button("q", "quit", "<cmd>q!<cr>")
    }
    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
