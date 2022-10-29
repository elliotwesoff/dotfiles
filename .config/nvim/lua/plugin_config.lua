local function apply_ddc_config()
  vim.api.nvim_call_function('ddc#custom#patch_global', {'ui', 'native'})
  vim.api.nvim_call_function('ddc#custom#patch_global', {'sources', {'nvim-lsp', 'treesitter', 'buffer'}})
  -- vim.cmd("call ddc#custom#patch_global('sources', ['nvim-lsp', 'treesitter', 'buffer'])")

  vim.cmd([[
      call ddc#custom#patch_global('sourceOptions', {
            \ '_': {
            \   'matchers': ['matcher_head'],
            \   'sorters': ['sorter_rank'] },
            \ 'nvim-lsp': {
            \   'mark': 'LSP',
            \   'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
            \ 'around': {'mark': 'A'},
            \ 'treesitter': {'mark': 'TREE'},
            \ 'buffer': {'mark': 'B'}
            \ })
  ]])
  vim.cmd([[
      call ddc#custom#patch_global('sourceParams', {
            \ 'around': {'maxSize': 500},
						\ 'nvim-lsp': { 'kindLabels': { 'Class': 'c' }, 'maxSize': 50 },
            \ 'buffer': {
            \   'requireSameFiletype': v:false,
            \   'limitBytes': 1000000,
            \   'fromAltBuf': v:true,
            \   'forceCollect': v:false,
            \ },
            \ })
  ]])
  vim.cmd([[
      call ddc#custom#patch_filetype(
      \ ['c', 'cpp', 'markdown'],
      \ 'sources',
      \ ['nvim-lsp', 'treesitter', 'around']
      \ )
  ]])
  vim.cmd([[
    " <TAB>: completion.
    inoremap <silent><expr> <TAB>
    \ pumvisible() ? '<C-n>' :
    \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
    \ '<TAB>' : ddc#map#manual_complete()

    " <S-TAB>: completion back.
    inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'
  ]])
  vim.cmd("call ddc#enable()")
end

local function apply_lsp_config()
  local keymap_opts = { noremap = true, silent = true }

  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, keymap_opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_opts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.setloclist, keymap_opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<A-F12>', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
  end

  local lspconfig = require('lspconfig')
  local lsp_flags = { debounce_text_changes = 50 }

  lspconfig.pyright.setup {
      on_attach = on_attach,
      flags = lsp_flags,
  }

  lspconfig.tsserver.setup {
      on_attach = on_attach,
      flags = lsp_flags,
  }

  lspconfig.sumneko_lua.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = {"vim"},
        },
      },
    }
  }

  lspconfig.ccls.setup {
    on_attach = on_attach,
    flags = lsp_flags
  }

  -- lspconfig.clangd.setup {
  --   on_attach = on_attach,
  --   flags = lsp_flags
  -- }
end

local function apply_lualine_config()
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

local function apply_nvim_tree_config()
  vim.g.loaded = 1
  vim.g.loaded_netrwPlugin = 1

  require("nvim-tree").setup({
    view = {
      adaptive_size = false,
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
          { key = "|", action = "vsplit" },
          { key = "s", action = "vsplit" },
          { key = "-", action = "split" },
          { key = "i", action = "split" },
          { key = "t", action = "tabnew" }
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
    }
  })
end

local function apply_telescope_config()
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

local function apply_treesitter_config()
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "lua", "cpp", "python", "typescript", "c_sharp", "cmake", "ruby", "sql", "markdown" },

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

local function apply_comment_config()
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
          line = '<Leader>,',
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

local function apply_peek_config()
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

local function apply_aerial_config()
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

local function apply_codewindow_config()
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

local function apply_symbolsoutline_config()
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

local function apply_indent_blankline_config()
  require("indent_blankline").setup {
    space_char_blankline = " "
  }
end

local function apply_noice_config()
  require('noice').setup()
end

local function apply_notify_config()
  require('notify').setup({
    background_colour = '#000000'
  })
end

return {
  apply_ddc_config = apply_ddc_config,
  apply_lsp_config = apply_lsp_config,
  apply_lualine_config = apply_lualine_config,
  apply_nvim_tree_config = apply_nvim_tree_config,
  apply_telescope_config = apply_telescope_config,
  apply_treesitter_config = apply_treesitter_config,
  apply_comment_config = apply_comment_config,
  apply_peek_config = apply_peek_config,
  apply_aerial_config = apply_aerial_config,
  apply_codewindow_config = apply_codewindow_config,
  apply_symbolsoutline_config = apply_symbolsoutline_config,
  apply_indent_blankline_config = apply_indent_blankline_config,
  apply_noice_config = apply_noice_config,
  apply_notify_config = apply_notify_config
}
