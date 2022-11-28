local M = {}

function M.apply_lsp_config()
  local keymap_opts = { noremap = true, silent = true }


  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, keymap_opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_opts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.setloclist, keymap_opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(_, bufnr) -- unused parameter is "client"
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts) -- replaced by glance.nvim
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    -- functionality here is normally covered by NvimTree
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)

    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)

    -- covered by glance.nvim
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', '<A-F12>', vim.lsp.buf.references, bufopts)

    -- this produces a deprecated warning. idk i don't use it anyway
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
  end

  local lspconfig = require('lspconfig')
  local lsp_flags = { debounce_text_changes = 50 }
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  lspconfig.pyright.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
  }

  lspconfig.tsserver.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
  }

  lspconfig.sumneko_lua.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = {"vim"},
        },
      },
    },
    capabilities = capabilities
  }

  lspconfig.ccls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
  }

  lspconfig.texlab.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
  }
end

function M.apply_lualine_config()
  require('lualine').setup {
    options = {
      icons_enabled = false,
      theme = 'auto',
      component_separators = { left = '🍕', right = '🌊' },
      section_separators = { left = '💥', right = '🍣' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = false,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
end

function M.apply_nvim_tree_config()
  vim.g.loaded = 1
  vim.g.loaded_netrwPlugin = 1

  require("nvim-tree").setup {
    open_on_setup = true,
    view = {
      adaptive_size = false,
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
          { key = "|", action = "vsplit" },
          { key = "s", action = "vsplit" },
          { key = "-", action = "split" },
          { key = "i", action = "split" },
          { key = "t", action = "tabnew" },
          { key = "<C-i>", action = ""}
        }
      }
    },
    renderer = {
      group_empty = true,
      highlight_git = true,
      highlight_opened_files = "icon",
      indent_markers = {
        enable = true
      }
    },
    filters = {
      dotfiles = true
    },
    remove_keymaps = { '<Tab>' }
  }
end

function M.apply_telescope_config()
  local telescope = require('telescope')

  telescope.setup {
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key"
        }
      }
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
    }
  }

  telescope.load_extension 'file_browser'
end

function M.apply_treesitter_config()
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "lua", "cpp", "python", "typescript", "c_sharp", "cmake", "ruby", "sql", "markdown", "latex" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      -- disable = { "c", "rust" },

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
    }
  }
end

function M.apply_comment_config()
  require('Comment').setup {
      ---Add a space b/w comment and the line
      padding = true,
      ---Whether the cursor should stay at its position
      sticky = true,
      ---Lines to be ignored while (un)comment
      ignore = nil,
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
          ---Line-comment toggle keymap
          -- line = '<Leader>,',
          line = '<Leader> ',
          ---Block-comment toggle keymap
          block = 'gbc',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
          ---Line-comment keymap
          line = '<Leader>,',
          ---Block-comment keymap
          block = 'gb',
      },
      ---LHS of extra mappings
      extra = {
          ---Add comment on the line above
          above = 'gcO',
          ---Add comment on the line below
          below = 'gco',
          ---Add comment at the end of line
          eol = 'gcA',
      },
      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
          ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
          basic = true,
          ---Extra mapping; `gco`, `gcO`, `gcA`
          extra = true,
      },
      ---Function to call before (un)comment
      pre_hook = nil,
      ---Function to call after (un)comment
      post_hook = nil
  }
end

function M.apply_peek_config()
  -- default config:
  require('peek').setup({
    auto_load = true,         -- whether to automatically load preview when
    close_on_bdelete = true,  -- close preview window on buffer delete
    syntax = true,            -- enable syntax highlighting, affects performance
    theme = 'dark',           -- 'dark' or 'light'
    update_on_change = true,
    -- relevant if update_on_change is true
    throttle_at = 200000     -- start throttling when file exceeds this
  })
end

function M.apply_aerial_config()
  require("aerial").setup({
    on_attach = function(bufnr)
      -- Toggle the aerial window with <leader>a
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
      -- Jump forwards/backwards with '{' and '}'
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
      -- Jump up the tree with '[[' or ']]'
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
      vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
    end
  })
end

function M.apply_codewindow_config()
  local codewindow = require('codewindow')
  local opts = {
    active_in_terminals = false, -- Should the minimap activate for terminal buffers
    auto_enable = false, -- Automatically open the minimap when entering a (non-excluded) buffer (accepts a table of filetypes)
    exclude_filetypes = {}, -- Choose certain filetypes to not show minimap on
    max_minimap_height = nil, -- The maximum height the minimap can take (including borders)
    max_lines = nil, -- If auto_enable is true, don't open the minimap for buffers which have more than this many lines.
    minimap_width = 10, -- The width of the text part of the minimap
    use_lsp = true, -- Use the builtin LSP to show errors and warnings
    use_treesitter = true, -- Use nvim-treesitter to highlight the code
    width_multiplier = 4, -- How many characters one dot represents
    z_index = 1, -- The z-index the floating window will be on
    show_cursor = true -- Show the cursor position in the minimap
  }

  codewindow.setup(opts)
  codewindow.apply_default_keybinds()
end

function M.apply_symbolsoutline_config()
  local opts = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    relative_width = true,
    width = 25,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    autofold_depth = nil,
    auto_unfold_hover = true,
    fold_markers = { '', '' },
    wrap = false,
    keymaps = { -- These keymaps can be a string or a table for multiple keys
      close = {"<Esc>", "q"},
      goto_location = "<Cr>",
      focus_location = "o",
      hover_symbol = "<C-space>",
      toggle_preview = "K",
      rename_symbol = "r",
      code_actions = "a",
      fold = "h",
      unfold = "l",
      fold_all = "W",
      unfold_all = "E",
      fold_reset = "R",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
      File = {icon = "", hl = "TSURI"},
      Module = {icon = "", hl = "TSNamespace"},
      Namespace = {icon = "", hl = "TSNamespace"},
      Package = {icon = "", hl = "TSNamespace"},
      Class = {icon = "𝓒", hl = "TSType"},
      Method = {icon = "ƒ", hl = "TSMethod"},
      Property = {icon = "", hl = "TSMethod"},
      Field = {icon = "", hl = "TSField"},
      Constructor = {icon = "", hl = "TSConstructor"},
      Enum = {icon = "ℰ", hl = "TSType"},
      Interface = {icon = "ﰮ", hl = "TSType"},
      Function = {icon = "", hl = "TSFunction"},
      Variable = {icon = "", hl = "TSConstant"},
      Constant = {icon = "", hl = "TSConstant"},
      String = {icon = "𝓐", hl = "TSString"},
      Number = {icon = "#", hl = "TSNumber"},
      Boolean = {icon = "⊨", hl = "TSBoolean"},
      Array = {icon = "", hl = "TSConstant"},
      Object = {icon = "⦿", hl = "TSType"},
      Key = {icon = "🔐", hl = "TSType"},
      Null = {icon = "NULL", hl = "TSType"},
      EnumMember = {icon = "", hl = "TSField"},
      Struct = {icon = "𝓢", hl = "TSType"},
      Event = {icon = "🗲", hl = "TSType"},
      Operator = {icon = "+", hl = "TSOperator"},
      TypeParameter = {icon = "𝙏", hl = "TSParameter"}
    }
  }

  require("symbols-outline").setup(opts)
end

function M.apply_noice_config()
  require('noice').setup()
end

function M.apply_notify_config()
  require('notify').setup({
    background_colour = '#000000'
  })
end

function M.apply_nvim_cmp_config()
  local cmp = require('cmp')
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  vim.cmd("set completeopt=menu,menuone,noselect")
  local cmp_kinds = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = '  ',
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
  }
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<TAB>'] = cmp.mapping.select_next_item(),
      ['<S-TAB>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    }),
    formatting = {
      format = function(_, vim_item)
        -- vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
        vim_item.kind = (cmp_kinds[vim_item.kind] or '')
        return vim_item
      end,
    }
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

function M.apply_onedarkpro_config()
  require("onedarkpro").setup({
    dark_theme = "onedark", -- The default dark theme
    light_theme = "onelight", -- The default light theme
    caching = false, -- Use caching for the theme?
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro/"), -- The path to the cache directory
    colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
    highlights = {}, -- Override default highlight and/or filetype groups
    filetypes = { -- Override which filetype highlight groups are loaded
      javascript = true,
      lua = true,
      markdown = true,
      php = true,
      python = true,
      ruby = true,
      rust = true,
      toml = true,
      vue = true,
      yaml = true,
    },
    plugins = { -- Override which plugin highlight groups are loaded
      -- See the Supported Plugins section for a list of available plugins
    },
    styles = { -- Choose from "bold,italic,underline"
      types = "NONE", -- Style that is applied to types
      numbers = "NONE", -- Style that is applied to numbers
      strings = "NONE", -- Style that is applied to strings
      comments = "NONE", -- Style that is applied to comments
      keywords = "NONE", -- Style that is applied to keywords
      constants = "NONE", -- Style that is applied to constants
      functions = "NONE", -- Style that is applied to functions
      operators = "NONE", -- Style that is applied to operators
      variables = "NONE", -- Style that is applied to variables
      conditionals = "NONE", -- Style that is applied to conditionals
      virtual_text = "NONE", -- Style that is applied to virtual text
    },
    options = {
      bold = true, -- Use bold styles?
      italic = true, -- Use italic styles?
      underline = true, -- Use underline styles?
      undercurl = true, -- Use undercurl styles?
      cursorline = true, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
      window_unfocused_color = false, -- When the window is out of focus, change the normal background?
    }
  })
end

function M.apply_glance_config()
  -- Lua configuration
  local glance = require('glance')
  local actions = glance.actions

  glance.setup({
    height = 18, -- Height of the window
    border = {
      enable = false, -- Show window borders. Only horizontal borders allowed
      top_char = '-',
      bottom_char = '-',
    },
    list = {
      position = 'right', -- Position of the list window 'left'|'right'
      width = 0.33, -- 33% width relative to the active window, min 0.1, max 0.5
    },
    theme = { -- This feature might not work properly in nvim-0.7.2
      enable = true, -- Will generate colors for the plugin based on your current colorscheme
      mode = 'auto', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
    },
    mappings = {
      list = {
        ['j'] = actions.next, -- Bring the cursor to the next item in the list
        ['k'] = actions.previous, -- Bring the cursor to the previous item in the list
        ['<Down>'] = actions.next,
        ['<Up>'] = actions.previous,
        ['<Tab>'] = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
        ['<S-Tab>'] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
        ['<C-u>'] = actions.preview_scroll_win(5),
        ['<C-d>'] = actions.preview_scroll_win(-5),
        ['v'] = actions.jump_vsplit,
        ['s'] = actions.jump_split,
        ['t'] = actions.jump_tab,
        ['<CR>'] = actions.jump,
        ['o'] = actions.jump,
        ['<leader>l'] = actions.enter_win('preview'), -- Focus preview window
        ['q'] = actions.close,
        ['Q'] = actions.close,
        ['<Esc>'] = actions.close,
      },
      preview = {
        ['Q'] = actions.close,
        ['<Tab>'] = actions.next_location,
        ['<S-Tab>'] = actions.previous_location,
        ['<leader>l'] = actions.enter_win('list'), -- Focus list window
      },
    },
    folds = {
      fold_closed = '',
      fold_open = '',
      folded = true, -- Automatically fold list on startup
    },
    indent_lines = {
      enable = true,
      icon = '│',
    },
    winbar = {
      enable = true, -- Available strating from nvim-0.8+
    },
  })
end

function M.apply_swap_split_config()
  require("swap-split").setup({ ignore_filetypes = { "NvimTree" } })
end

return M

